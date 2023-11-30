local Items = exports.ox_inventory.Items()
local incidents = {}
local convictions = {}
local bolos = {}
local MugShots = {}
local activeUnits = {}
local impound = {}
local dispatchMessages = {}
local isDispatchRunning = false
local antiSpam = false
local calls = {}
local FullJobList = ESX.GetJobs()
--------------------------------
-- SET YOUR WEHBOOKS IN HERE
-- Images for mug shots will be uploaded here. Add a Discord webhook. 
local MugShotWebhook = 'https://discord.com/api/webhooks/1168287405569220708/RfZo2y02-EpeRzfztoOi9ZZw3xuGtBOb7Yo5OBErAmoZBdLlmD_rgHUprNVmJPqCgG46'

-- Clock-in notifications for duty. Add a Discord webhook.
-- Command /mdtleaderboard, will display top players per clock-in hours.
local ClockinWebhook = 'https://discord.com/api/webhooks/1168287405569220708/RfZo2y02-EpeRzfztoOi9ZZw3xuGtBOb7Yo5OBErAmoZBdLlmD_rgHUprNVmJPqCgG46'

-- Incident and Incident editting. Add a Discord webhook.
-- Incident Author, Title, and Report will display in webhook post.
local IncidentWebhook = 'https://discord.com/api/webhooks/1168287405569220708/RfZo2y02-EpeRzfztoOi9ZZw3xuGtBOb7Yo5OBErAmoZBdLlmD_rgHUprNVmJPqCgG46'
--------------------------------

lib.callback.register('ps-mdt:server:MugShotWebhook', function(source)
    if MugShotWebhook == '' then
        print("\27[31mA webhook is missing in: MugShotWebhook (server > main.lua > line 16)\27[0m")
    else
        return MugShotWebhook
    end
end)

local function GetActiveData(identifier)
	local Player = type(identifier) == "string" and identifier or tostring(identifier)
	if Player then
		return activeUnits[Player] and true or false
	end
	return false
end

local function IsPoliceOrEms(job)
	for k, v in pairs(Config.PoliceJobs) do
           if job == k then
              return true
            end
         end
         
         for k, v in pairs(Config.AmbulanceJobs) do
           if job == k then
              return true
            end
         end
    return false
end

RegisterServerEvent("ps-mdt:dispatchStatus", function(bool)
	isDispatchRunning = bool
end)

if Config.UseWolfknightRadar == true then
	RegisterNetEvent("wk:onPlateScanned")
	AddEventHandler("wk:onPlateScanned", function(cam, plate, index)
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local PlayerData = ESX.GetPlayerFromId(src)
		local vehicleOwner = GetVehicleOwner(plate)
		local bolo, title, boloId = GetBoloStatus(plate)
		local warrant, owner, incidentId = GetWarrantStatus(plate)
		local driversLicense = PlayerData.metadata['licences'].driver

		if bolo == true then
			TriggerClientEvent('esx:showNotification', src, 'BOLO ID: '..boloId..' | Title: '..title..' | Registered Owner: '..vehicleOwner..' | Plate: '..plate, 'error', Config.WolfknightNotifyTime)
		end
		if warrant == true then
			TriggerClientEvent('esx:showNotification', src, 'WANTED - INCIDENT ID: '..incidentId..' | Registered Owner: '..owner..' | Plate: '..plate, 'error', Config.WolfknightNotifyTime)
		end

		if Config.PlateScanForDriversLicense and driversLicense == false and vehicleOwner then
			TriggerClientEvent('esx:showNotification', src, 'NO DRIVERS LICENCE | Registered Owner: '..vehicleOwner..' | Plate: '..plate, 'error', Config.WolfknightNotifyTime)
		end

		if bolo or warrant or (Config.PlateScanForDriversLicense and not driversLicense) and vehicleOwner then
			TriggerClientEvent("wk:togglePlateLock", src, cam, true, 1)
		end
	end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
	Wait(3000)
	if MugShotWebhook == '' then
		print("\27[31mA webhook is missing in: MugShotWebhook (server > main.lua > line 16)\27[0m")
    end
    if ClockinWebhook == '' then
		print("\27[31mA webhook is missing in: ClockinWebhook (server > main.lua > line 20)\27[0m")
	end
	if GetResourceState(Config.dispatchName) == 'started' then
		local calls = exports[Config.dispatchName]:GetDispatchCalls()
		return calls
	end
	GetVehiclesFromDB()
	FullJobList = ESX.GetJobs()
end)

RegisterNetEvent("ps-mdt:server:OnPlayerUnload", function()
	--// Delete player from the MDT on logout
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if GetActiveData(Player.identifier) then
		activeUnits[Player.identifier] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local PlayerData = ESX.GetPlayerFromId(src)
	if PlayerData == nil then return end -- Player not loaded in correctly and dropped early

    local time = os.date("%Y-%m-%d %H:%M:%S")
    local job = PlayerData.job.name
    local firstName = PlayerData.get('firstName')
    local lastName = PlayerData.get('lastName')

    -- Auto clock out if the player is off duty
     if IsPoliceOrEms(job) and Player(PlayerData.source).state.onduty then
		MySQL.query.await('UPDATE mdt_clocking SET clock_out_time = NOW(), total_time = TIMESTAMPDIFF(SECOND, clock_in_time, NOW()) WHERE user_id = @user_id ORDER BY id DESC LIMIT 1', {
			['@user_id'] = PlayerData.identifier
		})

		local result = MySQL.scalar.await('SELECT total_time FROM mdt_clocking WHERE user_id = @user_id', {
			['@user_id'] = PlayerData.identifier
		})
		if result then
			local time_formatted = format_time(tonumber(result))

			local log = string.format("Joueur: **%s %s**\n\nJob: **%s**\n\nRang: **%s**\n\nMatricule: **%s**\n\nStatus: **Fin Service**\n Durée total: %s", firstName, lastName, PlayerData.job.label, PlayerData.job.grade_label, Player(PlayerData.source).state.callsign, time_formatted or "")

			sendToDiscord(16711680, "MDT Fin de Service", log, "ps-mdt | Edited by Lexinor")
		end
	end

    -- Delete player from the MDT on logout
    if PlayerData ~= nil then
        if GetActiveData(PlayerData.identifier) then
            activeUnits[PlayerData.identifier] = nil
        end
    else
        local license = QBCore.Functions.GetIdentifier(src, "license")
        local citizenids = GetCitizenID(license)

        for _, v in pairs(citizenids) do
            if GetActiveData(v.identifier) then
                activeUnits[v.identifier] = nil
            end
        end
    end
end)

RegisterNetEvent("ps-mdt:server:ToggleDuty", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Player(xPlayer.source).state.onduty then
		--// Remove from MDT
		if GetActiveData(xPlayer.identifier) then
			activeUnits[xPlayer.identifier] = nil
		end
    end
end)

lib.addCommand('mdtleaderboard', {
    help = "Afficher classement MDT",
    params = {},
}, function(source, args, raw)
    local PlayerData = ESX.GetPlayerFromId(source)
	local job = PlayerData.job.name

    if not IsPoliceOrEms(job) then
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas la permission d'utiliser cette commande.", 'error')
        return
    end

	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, total_time FROM mdt_clocking ORDER BY total_time DESC')

    local leaderboard_message = '**Classement MDT**\n\n'

    for i, record in ipairs(result) do
		local firstName = record.firstname:sub(1,1):upper()..record.firstname:sub(2)
		local lastName = record.lastname:sub(1,1):upper()..record.lastname:sub(2)
		local total_time = format_time(record.total_time)
	
		leaderboard_message = leaderboard_message .. i .. '. **' .. firstName .. ' ' .. lastName .. '** - ' .. total_time .. '\n'
	end

    sendToDiscord(16753920, "Classement MDT", leaderboard_message, "ps-mdt | Edited by Lexinor")
    TriggerClientEvent('esx:showNotification', source, "Classement MDT envoyé sur discord!", 'success')
end)

RegisterNetEvent("ps-mdt:server:ClockSystem", function()
    local src = source
    local PlayerData = ESX.GetPlayerFromId(src)
    local time = os.date("%Y-%m-%d %H:%M:%S")
    local firstName = PlayerData.get('firstName')
    local lastName = PlayerData.get('lastName')
    if Player(PlayerData.source).state.onduty  then
        
        TriggerClientEvent('esx:showNotification', source, "Vous êtes en service !", 'success')
		MySQL.Async.insert('INSERT INTO mdt_clocking (user_id, firstname, lastname, clock_in_time) VALUES (:user_id, :firstname, :lastname, :clock_in_time) ON DUPLICATE KEY UPDATE user_id = :user_id, firstname = :firstname, lastname = :lastname, clock_in_time = :clock_in_time', {
			user_id = PlayerData.identifier,
			firstname = firstName,
			lastname = lastName,
			clock_in_time = time
		}, function()
		end)
		
		
		local log = string.format("Joueur: **%s %s**\n\nJob: **%s**\n\nRang: **%s**\n\nMatricule: **%s**\n\nStatus: **En Service**\n Durée total: %s", firstName, lastName, PlayerData.job.label, PlayerData.job.grade_label, Player(PlayerData.source).state.callsign, time_formatted)
		
		sendToDiscord(65280, "MDT Prise de Service", log, "ps-mdt | Edited by Lexinor")
    else
		TriggerClientEvent('esx:showNotification', source, "Vous n'êtes plus en service", 'success')
		MySQL.query.await('UPDATE mdt_clocking SET clock_out_time = NOW(), total_time = TIMESTAMPDIFF(SECOND, clock_in_time, NOW()) WHERE user_id = @user_id ORDER BY id DESC LIMIT 1', {
			['@user_id'] = PlayerData.identifier
		})

		local result = MySQL.scalar.await('SELECT total_time FROM mdt_clocking WHERE user_id = @user_id', {
			['@user_id'] = PlayerData.identifier
		})
		local time_formatted = format_time(tonumber(result))
		
		local log = string.format("Joueur: **%s %s**\n\nJob: **%s**\n\nRang: **%s**\n\nMatricule: **%s**\n\nStatus: **Fin Service**\n Durée total: %s", firstName, lastName, PlayerData.job.label, PlayerData.job.grade_label, Player(PlayerData.source).state.callsign, time_formatted or "")

		sendToDiscord(16711680, "MDT Hors Service", log, "ps-mdt | Edited by Lexinor")
    end
end)

RegisterNetEvent('mdt:server:openMDT', function()
	local src = source
	local PlayerData = ESX.GetPlayerFromId(src)
	if not PermCheck(src, PlayerData) then return end
	local Radio = Player(src).state.radioChannel or 0
		
	if GetResourceState(Config.dispatchName) == 'started' then
		calls = exports[Config.dispatchName]:GetDispatchCalls()
	end
		
	activeUnits[PlayerData.identifier] = {
		identifier = PlayerData.identifier,
		callsign = Player(PlayerData.source).state.callsign,
		firstName = PlayerData.get('firstName'),
		lastName = PlayerData.get('lastName'),
		radio = Radio,
		unitType = PlayerData.job.name,
		duty = Player(PlayerData.source).state.onduty
	}

	local JobType = GetJobType(PlayerData.job.name)
	local bulletin = GetBulletins(JobType)
	TriggerClientEvent('mdt:client:open', src, bulletin, activeUnits, calls, PlayerData.identifier)
end)

lib.callback.register('mdt:server:SearchProfile', function(source, sentData)
    if not sentData then return {} end
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if Player then
        local JobType = GetJobType(Player.job.name)
        if JobType ~= nil then

			-- We execute this request to insert the profiles that are not in mdt_data yet for the given jobtype
			MySQL.query.await("INSERT INTO mdt_data (identifier, jobtype, pfp, tags, gallery, fingerprint)	SELECT u.identifier, :jobtype AS jobtype, NULL AS pfp, '[]' AS tags, '[]' AS gallery, NULL AS fingerprint FROM users u	LEFT JOIN mdt_data md ON u.identifier = md.identifier AND md.jobtype = :jobtype	WHERE md.identifier IS NULL", { jobtype = JobType })

            local people = MySQL.query.await("SELECT u.identifier, u.firstname, u.lastname, u.dateofbirth, u.sex, md.pfp, md.fingerprint FROM users u LEFT JOIN mdt_data md on u.identifier = md.identifier WHERE jobtype = :jobtype AND LOWER(CONCAT(u.firstname, ' ', u.lastname)) LIKE :query OR LOWER(u.dateofbirth) LIKE :query OR LOWER(md.fingerprint) LIKE :query LIMIT 20", { query = string.lower('%'..sentData..'%'), jobtype = JobType })

            local identifiers = {}
            local identifiersMap = {}
            if not next(people) then return {} end
			
			local licencesdata = GetAllLicenses()
            for index, data in pairs(people) do
                people[index]['warrant'] = false
                people[index]['convictions'] = 0
                people[index]['licences'] = GetPlayerLicenses(data.identifier)
                people[index]['pp'] = ProfPic(data.sex, data.pfp)
				if data.fingerprint and data.fingerprint ~= "" then
					people[index]['fingerprint'] = data.fingerprint
				else
					people[index]['fingerprint'] = ""
				end				
                identifiers[#identifiers+1] = data.identifier
                identifiersMap[data.identifier] = index

				local userLicences = GetPlayerLicenses(data.identifier)
				if userLicences then
					for k, v in pairs(userLicences) do
						if licencesdata[v.type] then
							licencesdata[v.type].status = true
						end
					end
				end
				people[index]['licences'] = licencesdata
            end

            local convictions = GetConvictions(identifiers)

            if next(convictions) then
                for _, conv in pairs(convictions) do
                    if conv.warrant == "1" then people[identifiersMap[conv.identifier]].warrant = true end

                    local charges = json.decode(conv.charges)
                    people[identifiersMap[conv.identifier]].convictions = people[identifiersMap[conv.identifier]].convictions + #charges
                end
            end
			TriggerClientEvent('mdt:client:searchProfile', src, people, false)

            return people
        end
    end

    return {}
end)

lib.callback.register("mdt:server:getWarrants", function(source)
    local WarrantData = {}
    local data = MySQL.query.await("SELECT * FROM mdt_convictions", {})
    for _, conviction in pairs(data) do
        if conviction.warrant == "1" then
			local xPlayer = ESX.GetPlayerFromIdentifier(conviction.identifier)
			WarrantData[#WarrantData+1] = {
                identifier = conviction.identifier,
                linkedincident = conviction.linkedincident,
                name = xPlayer.name,
                time = conviction.time
            }
        end
    end
    return WarrantData
end)

lib.callback.register('mdt:server:OpenDashboard', function(source)
	local PlayerData = ESX.GetPlayerFromId(source)
	if not PermCheck(source, PlayerData) then return end
	local JobType = GetJobType(PlayerData.job.name)
	local bulletin = GetBulletins(JobType)
	return bulletin
end)

RegisterNetEvent('mdt:server:NewBulletin', function(title, info, time)
	local src = source
	local PlayerData = ESX.GetPlayerFromId(src)
	if not PermCheck(src, PlayerData) then return end
	local JobType = GetJobType(PlayerData.job.name)
	local playerName = GetNameFromPlayerData(PlayerData)
	local newBulletin = MySQL.insert.await('INSERT INTO `mdt_bulletin` (`title`, `desc`, `author`, `time`, `jobtype`) VALUES (:title, :desc, :author, :time, :jt)', {
		title = title,
		desc = info,
		author = playerName,
		time = tostring(time),
		jt = JobType
	})

	AddLog(("A new bulletin was added by %s with the title: %s!"):format(playerName, title))
	TriggerClientEvent('mdt:client:newBulletin', -1, src, {id = newBulletin, title = title, info = info, time = time, author = PlayerData.identifier}, JobType)
end)

RegisterNetEvent('mdt:server:deleteBulletin', function(id, title)
	if not id then return false end
	local src = source
	local PlayerData = ESX.GetPlayerFromId(src)
	if not PermCheck(src, PlayerData) then return end
	local JobType = GetJobType(PlayerData.job.name)

	MySQL.query.await('DELETE FROM `mdt_bulletin` where id = ?', {id})
	AddLog("Bulletin with Title: "..title.." was deleted by " .. GetNameFromPlayerData(PlayerData) .. ".")
end)

lib.callback.register('mdt:server:GetProfileData', function(source, sentId)
	if not sentId then return {} end

	local src = source
	local PlayerData = ESX.GetPlayerFromId(src)
	if not PermCheck(src, PlayerData) then return {} end

	local JobType = GetJobType(PlayerData.job.name)
	local JobName = PlayerData.job.name
	--local target = ESX.GetPlayerFromId(sentId)
	
	local apartmentData = nil
	
	local target = MySQL.single.await("SELECT identifier, jobs.label as job_label, jb.label as grade_label, firstname, lastname, dateofbirth, sex, height FROM users u, jobs, job_grades jb WHERE u.identifier = ? AND u.job = jobs.name AND u.job = jb.job_name AND u.job_grade = jb.grade", {sentId})

	if not target then return {} end

	local licencesdata = GetAllLicenses() or Config.Licenses
	local userLicences = GetPlayerLicenses(target.identifier)
	if userLicences then
		for k, v in pairs(userLicences) do
			if licencesdata[v.type] then
				licencesdata[v.type].status = true
			end
		end
	end

	if SVConfig.HousingScript == "ps" then
		local propertyData = GetPlayerPropertiesByCitizenId(target.identifier)
		if propertyData and next(propertyData) then
			local apartmentList = {}
			for i, property in ipairs(propertyData) do
				if property.apartment then
					table.insert(apartmentList, property.apartment .. ' Apt # (' .. property.property_id .. ')')
				end
			end
			if #apartmentList > 0 then
				apartmentData = table.concat(apartmentList, ', ')
			else
				TriggerClientEvent('esx:showAdvancedNotification', src, 'The citizen does not have an apartment.', 'error')
				print('The citizen does not have an apartment. Set SVConfig.HousingScript to other than "ps".')
			end
		else
			TriggerClientEvent('esx:showAdvancedNotification', src, 'The citizen does not have a property.', 'error')
			print('The citizen does not have a property. Set SVConfig.HousingScript to other than "ps".')
		end	
    elseif SVConfig.HousingScript == "qb" then
        apartmentData = GetPlayerApartment(target.identifier)
        if apartmentData then
            if apartmentData[1] then
                apartmentData = apartmentData[1].label .. ' (' ..apartmentData[1].name..')'
            else
                TriggerClientEvent('esx:showAdvancedNotification', src, 'The citizen does not have an apartment.', 'error')
                print('The citizen does not have an apartment. Set SVConfig.HousingScript to other than "qb".')
            end
        else
            TriggerClientEvent('esx:showAdvancedNotification', src, 'The citizen does not have an apartment.', 'error')
            print('The citizen does not have an apartment. Set SVConfig.HousingScript to other than "qb".')
        end
	elseif SVConfig.HousingScript == "qs" then
        --- TODO
    end
	
	local person = {
		identifier = target.identifier,
		firstname = target.firstname,
		lastname = target.lastname,
		job = target.job_label,
		--grade = target.grade_label,
		apartment = apartmentData,
		pp = ProfPic(target.sex),
		licences = licencesdata,
		dob = target.dateofbirth,
		fingerprint = 'target.metadata.fingerprint',
		phone = '',
		mdtinfo = '',
		tags = {},
		vehicles = {},
		properties = {},
		gallery = {},
		isLimited = false
	}

	if Config.PoliceJobs[JobName] or Config.DojJobs[JobName] then
		local convictions = GetConvictions({person.identifier})
		local incidents = {}
		person.convictions2 = {}
		local convCount = 1
		if next(convictions) then
			for _, conv in pairs(convictions) do
				if conv.warrant == "1" then person.warrant = true end
				
				-- Get the incident details
				local id = conv.linkedincident
				local incident = GetIncidentName(id)

				if incident then
					incidents[#incidents + 1] = {
						id = id,
						title = incident.title,
						time = conv.time
					}
				end

				local charges = json.decode(conv.charges)
				for _, charge in pairs(charges) do
					person.convictions2[convCount] = charge
					convCount = convCount + 1
				end
			end
		end

		person.incidents = incidents

		local hash = {}
		person.convictions = {}

		for _,v in ipairs(person.convictions2) do
			if (not hash[v]) then
				person.convictions[#person.convictions+1] = v
				hash[v] = true
			end
		end

		local vehicles = GetPlayerVehicles(person.identifier)

		if vehicles then
			person.vehicles = vehicles
		end

		if SVConfig.HousingScript == "ps" then
    		local Coords = {}
    		local Houses = {}
			local propertyData = GetPlayerPropertiesByCitizenId(target.identifier)
    		for k, v in pairs(propertyData) do
				if not v.apartment then
    		    	Coords[#Coords + 1] = {
    		    	    coords = json.decode(v["door_data"]),
    		    	    street = v["street"],
    		    	    propertyid = v["property_id"],
    		    	}
				end
    		end
    		for index = 1, #Coords do
    		    local coordsLocation, label
    		    local coords = Coords[index]["coords"]

    		    coordsLocation = tostring(coords.x .. "," .. coords.y .. "," .. coords.z)
    		    label = tostring(Coords[index].propertyid .. " " .. Coords[index].street)
			
    		    Houses[#Houses + 1] = {
    		        label = label,
    		        coords = coordsLocation,
    		    }
    		end
			person.properties = Houses
		else
			local Coords = {}
			local Houses = {}
			local properties= GetPlayerProperties(person.identifier)
			for k, v in pairs(properties) do
				Coords[#Coords+1] = {
					coords = json.decode(v["coords"]),
				}
			end
			for index = 1, #Coords, 1 do
				Houses[#Houses+1] = {
					label = properties[index]["label"],
					coords = tostring(Coords[index]["coords"]["enter"]["x"]..",".. Coords[index]["coords"]["enter"]["y"].. ",".. Coords[index]["coords"]["enter"]["z"]),
				}
			end
			person.properties = Houses
		end
	end
	local mdtData = GetPersonInformation(sentId, JobType)
	if mdtData then
		person.mdtinfo = mdtData.information
		person.pp = ProfPic(person.sex, mdtData.pfp)
		person.tags = json.decode(mdtData.tags)
		person.gallery = json.decode(mdtData.gallery)
		person.fingerprint = mdtData.fingerprint
		print("Fetched fingerprint from mdt_data:", mdtData.fingerprint)
	end

	return person
end)

RegisterNetEvent("mdt:server:saveProfile", function(pfp, information, identifier, fName, sName, tags, gallery, licenses, fingerprint)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    --UpdateAllLicenses(identifier, licenses)
    if Player then
        local JobType = GetJobType(Player.job.name)
        if JobType == 'doj' then JobType = 'police' end

        MySQL.Async.insert('INSERT INTO mdt_data (identifier, information, pfp, jobtype, tags, gallery, fingerprint) VALUES (:identifier, :information, :pfp, :jobtype, :tags, :gallery, :fingerprint) ON DUPLICATE KEY UPDATE identifier = :identifier, information = :information, pfp = :pfp, jobtype = :jobtype, tags = :tags, gallery = :gallery, fingerprint = :fingerprint', {
            identifier = identifier,
            information = information,
            pfp = pfp,
            jobtype = JobType,
            tags = json.encode(tags),
            gallery = json.encode(gallery),
            fingerprint = fingerprint,
        }, function()
        end)
    end
end)


-- Mugshotd
RegisterNetEvent('cqc-mugshot:server:triggerSuspect', function(suspect)
    TriggerClientEvent('cqc-mugshot:client:trigger', suspect, suspect)
end)

RegisterNetEvent('psmdt-mugshot:server:MDTupload', function(identifier, MugShotURLs)
    MugShots[identifier] = MugShotURLs
    local identifier = identifier
    MySQL.Async.insert('INSERT INTO mdt_data (identifier, pfp, gallery, tags) VALUES (:identifier, :pfp, :gallery, :tags) ON DUPLICATE KEY UPDATE identifier = :identifier,  pfp = :pfp, tags = :tags, gallery = :gallery', {
		identifier = identifier,
		pfp = MugShotURLs[1],
		tags = json.encode(tags),
		gallery = json.encode(MugShotURLs),
	})
end)

RegisterNetEvent("mdt:server:updateLicense", function(identifier, type, status)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		if GetJobType(Player.job.name) == 'police' then
			ManageLicense(identifier, type, status)
		end
	end
end)

-- Incidents

RegisterNetEvent('mdt:server:getAllIncidents', function()
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'doj' then
			local matches = MySQL.query.await("SELECT * FROM `mdt_incidents` ORDER BY `id` DESC LIMIT 30", {})

			TriggerClientEvent('mdt:client:getAllIncidents', src, matches)
		end
	end
end)

RegisterNetEvent('mdt:server:searchIncidents', function(query)
	if query then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' then
				local matches = MySQL.query.await("SELECT * FROM `mdt_incidents` WHERE `id` LIKE :query OR LOWER(`title`) LIKE :query OR LOWER(`author`) LIKE :query OR LOWER(`details`) LIKE :query OR LOWER(`tags`) LIKE :query OR LOWER(`officersinvolved`) LIKE :query OR LOWER(`civsinvolved`) LIKE :query OR LOWER(`author`) LIKE :query ORDER BY `id` DESC LIMIT 50", {
					query = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
				})

				TriggerClientEvent('mdt:client:getIncidents', src, matches)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:getIncidentData', function(sentId)
	if sentId then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' then
				local matches = MySQL.query.await("SELECT * FROM `mdt_incidents` WHERE `id` = :id", {
					id = sentId
				})
				local data = matches[1]
				data['tags'] = json.decode(data['tags'])
				data['officersinvolved'] = json.decode(data['officersinvolved'])
				data['civsinvolved'] = json.decode(data['civsinvolved'])
				data['evidence'] = json.decode(data['evidence'])


				local convictions = MySQL.query.await("SELECT * FROM `mdt_convictions` WHERE `linkedincident` = :id", {
					id = sentId
				})
				if convictions ~= nil then
					for i=1, #convictions do
						local xPlayer = ESX.GetPlayerFromIdentifier(convictions[i]['identifier'])
						if res ~= nil then
							convictions[i]['name'] = xPlayer.name
						else
							convictions[i]['name'] = "Unknown"
						end
						convictions[i]['charges'] = json.decode(convictions[i]['charges'])
					end
				end
				TriggerClientEvent('mdt:client:getIncidentData', src, data, convictions)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:getAllBolos', function()
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		local matches = MySQL.query.await("SELECT * FROM `mdt_bolos` WHERE jobtype = :jobtype", {jobtype = JobType})
		TriggerClientEvent('mdt:client:getAllBolos', src, matches)
	end
end)

RegisterNetEvent('mdt:server:searchBolos', function(sentSearch)
	if sentSearch then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'ambulance' then
			local matches = MySQL.query.await("SELECT * FROM `mdt_bolos` WHERE `id` LIKE :query OR LOWER(`title`) LIKE :query OR `plate` LIKE :query OR LOWER(`owner`) LIKE :query OR LOWER(`individual`) LIKE :query OR LOWER(`detail`) LIKE :query OR LOWER(`officersinvolved`) LIKE :query OR LOWER(`tags`) LIKE :query OR LOWER(`author`) LIKE :query AND jobtype = :jobtype", {
				query = string.lower('%'..sentSearch..'%'), -- % wildcard, needed to search for all alike results
				jobtype = JobType
			})
			TriggerClientEvent('mdt:client:getBolos', src, matches)
		end
	end
end)

RegisterNetEvent('mdt:server:getBoloData', function(sentId)
	if sentId then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'ambulance' then
			local matches = MySQL.query.await("SELECT * FROM `mdt_bolos` WHERE `id` = :id AND jobtype = :jobtype LIMIT 1", {
				id = sentId,
				jobtype = JobType
			})

			local data = matches[1]
			data['tags'] = json.decode(data['tags'])
			data['officersinvolved'] = json.decode(data['officersinvolved'])
			data['gallery'] = json.decode(data['gallery'])
			TriggerClientEvent('mdt:client:getBoloData', src, data)
		end
	end
end)

RegisterNetEvent('mdt:server:newBolo', function(existing, id, title, plate, owner, individual, detail, tags, gallery, officersinvolved, time)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'ambulance' then
			local fullname = Player.name

			local function InsertBolo()
				MySQL.insert('INSERT INTO `mdt_bolos` (`title`, `author`, `plate`, `owner`, `individual`, `detail`, `tags`, `gallery`, `officersinvolved`, `time`, `jobtype`) VALUES (:title, :author, :plate, :owner, :individual, :detail, :tags, :gallery, :officersinvolved, :time, :jobtype)', {
					title = title,
					author = fullname,
					plate = plate,
					owner = owner,
					individual = individual,
					detail = detail,
					tags = json.encode(tags),
					gallery = json.encode(gallery),
					officersinvolved = json.encode(officersinvolved),
					time = tostring(time),
					jobtype = JobType
				}, function(r)
					if r then
						TriggerClientEvent('mdt:client:boloComplete', src, r)
						TriggerEvent('mdt:server:AddLog', "A new BOLO was created by "..fullname.." with the title ("..title..") and ID ("..id..")")
					end
				end)
			end

			local function UpdateBolo()
				MySQL.update("UPDATE mdt_bolos SET `title`=:title, plate=:plate, owner=:owner, individual=:individual, detail=:detail, tags=:tags, gallery=:gallery, officersinvolved=:officersinvolved WHERE `id`=:id AND jobtype = :jobtype LIMIT 1", {
					title = title,
					plate = plate,
					owner = owner,
					individual = individual,
					detail = detail,
					tags = json.encode(tags),
					gallery = json.encode(gallery),
					officersinvolved = json.encode(officersinvolved),
					id = id,
					jobtype = JobType
				}, function(r)
					if r then
						TriggerClientEvent('mdt:client:boloComplete', src, id)
						TriggerEvent('mdt:server:AddLog', "A BOLO was updated by "..fullname.." with the title ("..title..") and ID ("..id..")")
					end
				end)
			end

			if existing then
				UpdateBolo()
			elseif not existing then
				InsertBolo()
			end
		end
	end
end)

RegisterNetEvent('mdt:server:deleteWeapons', function(id)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Config.RemoveWeaponsPerms[Player.job.name] then
			if Config.RemoveWeaponsPerms[Player.job.name][Player.job.grade] then
				local fullName = Player.name
				MySQL.update("DELETE FROM `mdt_weaponinfo` WHERE id=:id", { id = id })
				TriggerEvent('mdt:server:AddLog', "A Weapon Info was deleted by "..fullName.." with the ID ("..id..")")
			else
				local fullname = Player.name
				TriggerClientEvent('esx:showAdvancedNotification', src, 'No Permissions to do that!', 'error')
				TriggerEvent('mdt:server:AddLog', fullname.." tryed to delete a Weapon Info with the ID ("..id..")")
			end
		end
	end
end)

RegisterNetEvent('mdt:server:deleteReports', function(id)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Config.RemoveReportPerms[Player.job.name] then
			if Config.RemoveReportPerms[Player.job.name][Player.job.grade] then
				local fullName = Player.name
				MySQL.update("DELETE FROM `mdt_reports` WHERE id=:id", { id = id })
				TriggerEvent('mdt:server:AddLog', "A Report was deleted by "..fullName.." with the ID ("..id..")")
			else
				local fullname = Player.name
				TriggerClientEvent('esx:showAdvancedNotification', src, 'No Permissions to do that!', 'error')
				TriggerEvent('mdt:server:AddLog', fullname.." tryed to delete a Report with the ID ("..id..")")
			end
		end
	end
end)

RegisterNetEvent('mdt:server:deleteIncidents', function(id)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if Config.RemoveIncidentPerms[Player.job.name] then
        if Config.RemoveIncidentPerms[Player.job.name][Player.job.grade] then
            local fullName = Player.name
            MySQL.update("DELETE FROM `mdt_convictions` WHERE `linkedincident` = :id", {id = id})
            MySQL.update("UPDATE `mdt_convictions` SET `warrant` = '0' WHERE `linkedincident` = :id", {id = id}) -- Delete any outstanding warrants from incidents
            MySQL.update("DELETE FROM `mdt_incidents` WHERE id=:id", { id = id }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerEvent('mdt:server:AddLog', "A Incident was deleted by "..fullName.." with the ID ("..id..")")
                end
            end)
        else
            local fullname = Player.name
            TriggerClientEvent('esx:showAdvancedNotification', src, 'No Permissions to do that!', 'error')
            TriggerEvent('mdt:server:AddLog', fullname.." tried to delete an Incident with the ID ("..id..")")
        end
    end
end)

RegisterNetEvent('mdt:server:deleteBolo', function(id)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' then
			local fullname = Player.name
			MySQL.update("DELETE FROM `mdt_bolos` WHERE id=:id", { id = id, jobtype = JobType })
			TriggerEvent('mdt:server:AddLog', "A BOLO was deleted by "..fullname.." with the ID ("..id..")")
		end
	end
end)

RegisterNetEvent('mdt:server:deleteICU', function(id)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		local JobType = GetJobType(Player.job.name)
		if JobType == 'ambulance' then
			local fullname = Player.name
			MySQL.update("DELETE FROM `mdt_bolos` WHERE id=:id", { id = id, jobtype = JobType })
			TriggerEvent('mdt:server:AddLog', "A ICU Check-in was deleted by "..fullname.." with the ID ("..id..")")
		end
	end
end)

RegisterNetEvent('mdt:server:incidentSearchPerson', function(firstname, lastname)
	print(type(firstname), firstname ~= "")
	print(type(lastname), lastname ~= "")
    if firstname or lastname then
        local src = source
        local Player = ESX.GetPlayerFromId(src)
        if Player then
            local JobType = GetJobType(Player.job.name)
            if JobType == 'police' or JobType == 'doj' or JobType == 'ambulance' then
                local function ProfPic(gender, profilepic)
                    if profilepic then return profilepic end;
                    if gender == "f" then return "img/female.png" end;
                    return "img/male.png"
                end

                -- local firstname, lastname = query:match("^(%S+)%s*(%S*)$")
                -- firstname = firstname or query
                -- lastname = lastname or query
				-- OR LOWER(u.firstname) LIKE :firstname OR LOWER(u.lastname) LIKE :lastname
				-- local result = MySQL.query.await("SELECT u.identifier, u.firstname, u.lastname, u.callsign, md.pfp, u.metadata FROM users u LEFT JOIN mdt_data md on u.identifier = md.identifier WHERE LOWER(u.firstname) LIKE :firstname AND LOWER(u.lastname) LIKE :lastname OR LOWER(u.identifier) LIKE :identifier AND `jobtype` = :jobtype LIMIT 50", {
                --     firstname = string.lower('%' .. firstname .. '%'),
                --     lastname = string.lower('%' .. lastname .. '%'),
                --     identifier = string.lower('%' .. query .. '%'),
                --     jobtype = JobType
                -- })
				local result = nil
				if firstname ~= "" and lastname ~= "" then
					result = MySQL.query.await("SELECT u.identifier, u.firstname, u.lastname, u.callsign, md.pfp, u.metadata FROM users u LEFT JOIN mdt_data md on u.identifier = md.identifier WHERE LOWER(u.firstname) LIKE :firstname AND LOWER(u.lastname) LIKE :lastname AND `jobtype` = :jobtype LIMIT 50", {
						firstname = string.lower('%' .. firstname .. '%'),
						lastname = string.lower('%' .. lastname .. '%'),
						jobtype = JobType
					})
				elseif firstname ~= "" and lastname == "" then
					result = MySQL.query.await("SELECT u.identifier, u.firstname, u.lastname, u.callsign, md.pfp, u.metadata FROM users u LEFT JOIN mdt_data md on u.identifier = md.identifier WHERE LOWER(u.firstname) LIKE :firstname AND `jobtype` = :jobtype LIMIT 50", {
						firstname = string.lower('%' .. firstname .. '%'),
						jobtype = JobType
					})
				elseif firstname == "" and lastname ~= "" then
					print("ok3")
					result = MySQL.query.await("SELECT u.identifier, u.firstname, u.lastname, u.callsign, md.pfp, u.metadata FROM users u LEFT JOIN mdt_data md on u.identifier = md.identifier WHERE LOWER(u.lastname) LIKE :lastname AND `jobtype` = :jobtype LIMIT 50", {
						lastname = string.lower('%' .. lastname .. '%'),
						jobtype = JobType
					})
				end
				print(result)
                local data = {}
				for k, person in pairs(result) do
					print(person.firstname)
					print(person.lastname)
					data[k] = {
						id = person.identifier,
						firstname = person.firstname,
						lastname = person.lastname,
						profilepic = ProfPic(person.sex, person.pfp),
						callsign = person.callsign
					}
				end
                -- for i=1, #result do					
                --     --local metadata = json.decode(result[i].metadata)
                --     data[i] = {
                --         id = result[i].identifier,
                --         firstname = result[i].firstname,
                --         lastname = result[i].lastname,
                --         profilepic = ProfPic(result[i].sex, result[i].pfp),
                --         callsign = result[i].callsign
                --     }
                -- end
                TriggerClientEvent('mdt:client:incidentSearchPerson', src, data)
            end
        end
    end
end)

RegisterNetEvent('mdt:server:getAllReports', function()
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'doj' or JobType == 'ambulance' then
			if JobType == 'doj' then JobType = 'police' end
			local matches = MySQL.query.await("SELECT * FROM `mdt_reports` WHERE jobtype = :jobtype ORDER BY `id` DESC LIMIT 30", {
				jobtype = JobType
			})
			TriggerClientEvent('mdt:client:getAllReports', src, matches)
		end
	end
end)

RegisterNetEvent('mdt:server:getReportData', function(sentId)
	if sentId then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' or JobType == 'ambulance' then
				if JobType == 'doj' then JobType = 'police' end
				local matches = MySQL.query.await("SELECT * FROM `mdt_reports` WHERE `id` = :id AND `jobtype` = :jobtype LIMIT 1", {
					id = sentId,
					jobtype = JobType
				})
				local data = matches[1]
				data['tags'] = json.decode(data['tags'])
				data['officersinvolved'] = json.decode(data['officersinvolved'])
				data['civsinvolved'] = json.decode(data['civsinvolved'])
				data['gallery'] = json.decode(data['gallery'])
				TriggerClientEvent('mdt:client:getReportData', src, data)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:searchReports', function(sentSearch)
	if sentSearch then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' or JobType == 'ambulance' then
				if JobType == 'doj' then JobType = 'police' end
				local matches = MySQL.query.await("SELECT * FROM `mdt_reports` WHERE `id` LIKE :query OR LOWER(`author`) LIKE :query OR LOWER(`title`) LIKE :query OR LOWER(`type`) LIKE :query OR LOWER(`details`) LIKE :query OR LOWER(`tags`) LIKE :query AND `jobtype` = :jobtype ORDER BY `id` DESC LIMIT 50", {
					query = string.lower('%'..sentSearch..'%'), -- % wildcard, needed to search for all alike results
					jobtype = JobType
				})

				TriggerClientEvent('mdt:client:getAllReports', src, matches)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:newReport', function(existing, id, title, reporttype, details, tags, gallery, officers, civilians, time)
	if id then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType ~= nil then
				local fullname = Player.name
				local function InsertReport()
					MySQL.insert('INSERT INTO `mdt_reports` (`title`, `author`, `type`, `details`, `tags`, `gallery`, `officersinvolved`, `civsinvolved`, `time`, `jobtype`) VALUES (:title, :author, :type, :details, :tags, :gallery, :officersinvolved, :civsinvolved, :time, :jobtype)', {
						title = title,
						author = fullname,
						type = reporttype,
						details = details,
						tags = json.encode(tags),
						gallery = json.encode(gallery),
						officersinvolved = json.encode(officers),
						civsinvolved = json.encode(civilians),
						time = tostring(time),
						jobtype = JobType,
					}, function(r)
						if r then
							TriggerClientEvent('mdt:client:reportComplete', src, r)
							TriggerEvent('mdt:server:AddLog', "A new report was created by "..fullname.." with the title ("..title..") and ID ("..id..")")
						end
					end)
				end

				local function UpdateReport()
					MySQL.update("UPDATE `mdt_reports` SET `title` = :title, type = :type, details = :details, tags = :tags, gallery = :gallery, officersinvolved = :officersinvolved, civsinvolved = :civsinvolved, jobtype = :jobtype WHERE `id` = :id LIMIT 1", {
						title = title,
						type = reporttype,
						details = details,
						tags = json.encode(tags),
						gallery = json.encode(gallery),
						officersinvolved = json.encode(officers),
						civsinvolved = json.encode(civilians),
						jobtype = JobType,
						id = id,
					}, function(affectedRows)
						if affectedRows > 0 then
							TriggerClientEvent('mdt:client:reportComplete', src, id)
							TriggerEvent('mdt:server:AddLog', "A report was updated by "..fullname.." with the title ("..title..") and ID ("..id..")")
						end
					end)
				end

				if existing then
					UpdateReport()
				elseif not existing then
					InsertReport()
				end
			end
		end
	end
end)

lib.callback.register('mdt:server:SearchVehicles', function(source, sentData)
	if not sentData then return {} end

	local PlayerData = ESX.GetPlayerFromId(source)
	if not PermCheck(source, PlayerData) then return {} end
	if PlayerData then
		local JobType = GetJobType(PlayerData.job.name)
		if JobType == 'police' or JobType == 'doj' then
			-- local vehicles = MySQL.query.await("SELECT pv.id, pv.identifier, pv.plate, pv.vehicle, pv.mods, pv.state, p.charinfo FROM `player_vehicles` pv LEFT JOIN players p ON pv.identifier = p.identifier WHERE LOWER(`plate`) LIKE :query OR LOWER(`vehicle`) LIKE :query LIMIT 25", {
			-- 	query = string.lower('%'..sentData..'%')
			-- })
			local vehicles = MySQL.query.await("SELECT ov.*, u.firstname, u.lastname FROM `owned_vehicles` ov LEFT JOIN users u ON ov.owner = u.identifier WHERE LOWER(`plate`) LIKE :query OR LOWER(`vehicle`) LIKE :query LIMIT 25", {
				query = string.lower('%'..sentData..'%')
			})

			if not next(vehicles) then return {} end
			
			for _, veh in ipairs(vehicles) do
				veh.vehicle = json.decode(veh.vehicle)
				local vName = GetVehicleHashByName(veh.vehicle.model)
				local infos = MySQL.single.await("SELECT * FROM vehicles WHERE model = ?", {vName})
				if infos then
					veh.infos = infos
					veh.model = infos.name
				end
				if veh.in_garage == 0 then
					veh.state = "Out"
				elseif veh.in_garage == 1 then
					veh.state = "Garaged"
				elseif veh.impound == 1 then
					veh.state = "Impounded"
				end

				veh.bolo = false
				local boloResult = GetBoloStatus(veh.plate)
				if boloResult then
					veh.bolo = true
				end

				veh.code = false
				veh.stolen = false
				veh.image = "img/not-found.webp"
				local info = GetVehicleInformation(veh.plate)
				if info then
					veh.code = info['code5']
					veh.stolen = info['stolen']
					veh.image = info['image']
				end

				if veh.firstname and veh.lastname then
					veh.owner = veh.firstname.. " "..veh.lastname
				elseif FullJobList[veh.owner] and FullJobList[veh.owner].label then
					veh.owner = FullJobList[veh.owner].label
				else
					veh.owner = "Personne Inconnue"
				end
			end

			return vehicles
		end

		return {}
	end
end)

RegisterNetEvent('mdt:server:getVehicleData', function(plate)
	if plate then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' then
				local veh = MySQL.single.await("select ov.*, u.firstname, u.lastname from owned_vehicles ov LEFT JOIN users u ON ov.owner = u.identifier where ov.plate = :plate", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1")})
				if veh then
					veh.impound = false
					if veh.impound == 1 then
						veh.impound = true
					else
						veh.impound = false
					end

					veh.bolo = GetBoloStatus(veh.plate)
					veh.information = ""

					if veh.firstname and veh.lastname then
						veh.name = veh.firstname.. " "..veh.lastname
					elseif FullJobList[veh.owner] and FullJobList[veh.owner].label then
						veh.name = FullJobList[veh.owner].label
					else
						veh.name = "Personne Inconnue"
					end

					veh.vehicle = json.decode(veh.vehicle)
					veh.color1 = veh.vehicle.color1

					local vName = GetVehicleHashByName(veh.vehicle.model)
					local infos = MySQL.single.await("SELECT * FROM vehicles WHERE model = ?", {vName})
					veh.infos = infos

					veh.dbid = 0

					local info = GetVehicleInformation(veh.plate)
					if info then
						veh.information = info.information
						veh.dbid = info.id
						veh.points = info.points
						veh.image = info.image
						veh.code = info.code5
						veh.stolen = info.stolen
					end

					if veh.image == nil then veh.image = "img/not-found.webp" end -- Image
				end

				TriggerClientEvent('mdt:client:getVehicleData', Player.source, veh)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:saveVehicleInfo', function(dbid, plate, imageurl, notes, stolen, code5, impoundInfo, points)
	if plate then
		local src = source
		local Player = ESX.GetPlayerFromId(src)
		if Player then
			if GetJobType(Player.job.name) == 'police' then
				if dbid == nil then dbid = 0 end;
				local fullname = Player.name
				TriggerEvent('mdt:server:AddLog', "A vehicle with the plate ("..plate..") has a new image ("..imageurl..") edited by "..fullname)
				if tonumber(dbid) == 0 then
					MySQL.insert('INSERT INTO `mdt_vehicleinfo` (`plate`, `information`, `image`, `code5`, `stolen`, `points`) VALUES (:plate, :information, :image, :code5, :stolen, :points)', { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1"), information = notes, image = imageurl, code5 = code5, stolen = stolen, points = tonumber(points) }, function(infoResult)
						if infoResult then
							TriggerClientEvent('mdt:client:updateVehicleDbId', src, infoResult)
							TriggerEvent('mdt:server:AddLog', "A vehicle with the plate ("..plate..") was added to the vehicle information database by "..fullname)
						end
					end)
				elseif tonumber(dbid) > 0 then
					MySQL.update("UPDATE mdt_vehicleinfo SET `information`= :information, `image`= :image, `code5`= :code5, `stolen`= :stolen, `points`= :points WHERE `plate`= :plate LIMIT 1", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1"), information = notes, image = imageurl, code5 = code5, stolen = stolen, points = tonumber(points) })
				end

				if impoundInfo.impoundChanged then
					local vehicle = MySQL.single.await("SELECT p.id, p.plate, i.vehicleid AS impoundid FROM `player_vehicles` p LEFT JOIN `mdt_impound` i ON i.vehicleid = p.id WHERE plate=:plate", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1") })
					if impoundInfo.impoundActive then
						local plate, linkedreport, fee, time = impoundInfo['plate'], impoundInfo['linkedreport'], impoundInfo['fee'], impoundInfo['time']
						if (plate and linkedreport and fee and time) then
							if vehicle.impoundid == nil then
								-- This section is copy pasted from request impound and needs some attention.
								-- sentVehicle doesnt exist.
								-- data is defined twice
								-- INSERT INTO will not work if it exists already (which it will)
								local data = vehicle
								MySQL.insert('INSERT INTO `mdt_impound` (`vehicleid`, `linkedreport`, `fee`, `time`) VALUES (:vehicleid, :linkedreport, :fee, :time)', {
									vehicleid = data['id'],
									linkedreport = linkedreport,
									fee = fee,
									time = os.time() + (time * 60)
								}, function(res)

									local data = {
										vehicleid = data['id'],
										plate = plate,
										beingcollected = 0,
										vehicle = sentVehicle,
										officer = Player.name,
										number = "",
										time = os.time() * 1000,
										src = src,
									}
									local vehicle = NetworkGetEntityFromNetworkId(sentVehicle)
									FreezeEntityPosition(vehicle, true)
									impound[#impound+1] = data

									TriggerClientEvent("police:client:ImpoundVehicle", src, true, fee)
								end)
								-- Read above comment
							end
						end
					else
						if vehicle.impoundid ~= nil then
							local data = vehicle
							local result = MySQL.single.await("SELECT id, vehicle, fuel, engine, body FROM `player_vehicles` WHERE plate=:plate LIMIT 1", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1")})
							if result then
								local data = result
								MySQL.update("DELETE FROM `mdt_impound` WHERE vehicleid=:vehicleid", { vehicleid = data['id'] })

								result.currentSelection = impoundInfo.CurrentSelection
								result.plate = plate
								TriggerClientEvent('ps-mdt:client:TakeOutImpound', src, result)
							end

						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('mdt:server:searchCalls', function(calls)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' then
		TriggerClientEvent('mdt:client:getCalls', src, calls)

	end
end)

lib.callback.register('mdt:server:SearchWeapons', function(source, sentData)
	if not sentData then return {} end
	local PlayerData = ESX.GetPlayerFromId(source)
	if not PermCheck(source, PlayerData) then return {} end

	local Player = PlayerData
	if Player then
		local JobType = GetJobType(Player.job.name)
		if JobType == 'police' or JobType == 'doj' then
			local matches = MySQL.query.await('SELECT * FROM mdt_weaponinfo WHERE LOWER(`serial`) LIKE :query OR LOWER(`weapModel`) LIKE :query OR LOWER(`owner`) LIKE :query LIMIT 25', {
				query = string.lower('%'..sentData..'%')
			})
			return matches
		end
	end
end)

RegisterNetEvent('mdt:server:saveWeaponInfo', function(serial, imageurl, notes, owner, weapClass, weapModel)
	if serial then
		local PlayerData = ESX.GetPlayerFromId(source)
		if not PermCheck(source, PlayerData) then return cb({}) end

		local Player = PlayerData
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' then
				local fullname = Player.name
				if imageurl == nil then imageurl = 'img/not-found.webp' end
				--AddLog event?
				local result = false
				result = MySQL.Async.insert('INSERT INTO mdt_weaponinfo (serial, owner, information, weapClass, weapModel, image) VALUES (:serial, :owner, :notes, :weapClass, :weapModel, :imageurl) ON DUPLICATE KEY UPDATE owner = :owner, information = :notes, weapClass = :weapClass, weapModel = :weapModel, image = :imageurl', {
					['serial'] = serial,
					['owner'] = owner,
					['notes'] = notes,
					['weapClass'] = weapClass,
					['weapModel'] = weapModel,
					['imageurl'] = imageurl,
				})

				if result then
					TriggerEvent('mdt:server:AddLog', "A weapon with the serial number ("..serial..") was added to the weapon information database by "..fullname)
				else
					TriggerEvent('mdt:server:AddLog', "A weapon with the serial number ("..serial..") failed to be added to the weapon information database by "..fullname)
				end
			end
		end
	end
end)

function CreateWeaponInfo(serial, imageurl, notes, owner, weapClass, weapModel)

	local results = MySQL.query.await('SELECT * FROM mdt_weaponinfo WHERE serial = ?', { serial })
	if results[1] then
		return
	end

	if serial == nil then return end
	if imageurl == nil then imageurl = 'img/not-found.webp' end

	MySQL.Async.insert('INSERT INTO mdt_weaponinfo (serial, owner, information, weapClass, weapModel, image) VALUES (:serial, :owner, :notes, :weapClass, :weapModel, :imageurl) ON DUPLICATE KEY UPDATE owner = :owner, information = :notes, weapClass = :weapClass, weapModel = :weapModel, image = :imageurl', {
		['serial'] = serial,
		['owner'] = owner,
		['notes'] = notes,
		['weapClass'] = weapClass,
		['weapModel'] = weapModel,
		['imageurl'] = imageurl,
	})
end

exports('CreateWeaponInfo', CreateWeaponInfo)

RegisterNetEvent('mdt:server:getWeaponData', function(serial)
	if serial then
		local Player = ESX.GetPlayerFromId(source)
		if Player then
			local JobType = GetJobType(Player.job.name)
			if JobType == 'police' or JobType == 'doj' then
				local results = MySQL.query.await('SELECT * FROM mdt_weaponinfo WHERE serial = ?', { serial })
				TriggerClientEvent('mdt:client:getWeaponData', Player.source, results)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:getAllLogs', function()
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		if Config.LogPerms[Player.job.name] then
			if Config.LogPerms[Player.job.name][Player.job.grade] then

				local JobType = GetJobType(Player.job.name)
				local infoResult = MySQL.query.await('SELECT * FROM mdt_logs WHERE `jobtype` = :jobtype ORDER BY `id` DESC LIMIT 250', {jobtype = JobType})

				TriggerLatentClientEvent('mdt:client:getAllLogs', src, 30000, infoResult)
			end
		end
	end
end)

-- Penal Code

local function IsCidFelon(sentCid, cb)
	if sentCid then
		local convictions = MySQL.query.await('SELECT charges FROM mdt_convictions WHERE identifier=:identifier', { identifier = sentCid })
		local Charges = {}
		for i=1, #convictions do
			local currCharges = json.decode(convictions[i]['charges'])
			for x=1, #currCharges do
				Charges[#Charges+1] = currCharges[x]
			end
		end
		local PenalCode = Config.PenalCode
		for i=1, #Charges do
			for p=1, #PenalCode do
				for x=1, #PenalCode[p] do
					if PenalCode[p][x]['title'] == Charges[i] then
						if PenalCode[p][x]['class'] == 'Felony' then
							cb(true)
							return
						end
						break
					end
				end
			end
		end
		cb(false)
	end
end

exports('IsCidFelon', IsCidFelon) -- exports['erp_mdt']:IsCidFelon()

RegisterCommand("isfelon", function(source, args, rawCommand)
	IsCidFelon(1998, function(res)
	end)
end, false)

RegisterNetEvent('mdt:server:getPenalCode', function()
	local src = source
	TriggerClientEvent('mdt:client:getPenalCode', src, Config.PenalCodeTitles, Config.PenalCode)
end)

RegisterNetEvent('mdt:server:setCallsign', function(identifier, newcallsign)
	-- local Player = ESX.GetPlayerFromIdentifier(identifier)
	-- Player.Functions.SetMetaData("callsign", newcallsign)
	local originSource = source
	if identifier ~= nil and newcallsign ~= nil then
		local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
		if xPlayer.identifier == identifier then
			TriggerEvent("lexinor_commons:setCallsignFromServer", xPlayer.source, newcallsign)
		else
			TriggerClientEvent('esx:showNotification', originSource, "Vous ne pouvez changer que votre propre matricule", "error", 5000)
		end	
	end
end)

RegisterNetEvent('mdt:server:saveIncident', function(id, title, information, tags, officers, civilians, evidence, associated, time)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if Player then
        if GetJobType(Player.job.name) == 'police' then
            if id == 0 then

                MySQL.insert('INSERT INTO `mdt_incidents` (`author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES (:author, :title, :details, :tags, :officersinvolved, :civsinvolved, :evidence, :time, :jobtype)',
                {
                    author = Player.name,
                    title = title,
                    details = information,
                    tags = json.encode(tags),
                    officersinvolved = json.encode(officers),
                    civsinvolved = json.encode(civilians),
                    evidence = json.encode(evidence),
                    time = time,
                    jobtype = 'police',
                }, function(infoResult)
                    if infoResult then
                        MySQL.Async.fetchAll('SELECT `author`, `title`, `details` FROM `mdt_incidents` WHERE `id` = @id', { ['@id'] = infoResult }, function(result)
                            if result and #result > 0 then
                                local message = generateMessageFromResult(result)
                                
                                for i=1, #associated do
                                    local associatedData = {
                                        identifier = associated[i]['identifier'],
                                        linkedincident = associated[i]['LinkedIncident'],
                                        warrant = associated[i]['Warrant'],
                                        guilty = associated[i]['Guilty'],
                                        processed = associated[i]['Processed'],
                                        associated = associated[i]['Isassociated'],
                                        charges = json.encode(associated[i]['Charges']),
                                        fine = tonumber(associated[i]['Fine']),
                                        sentence = tonumber(associated[i]['Sentence']),
                                        recfine = tonumber(associated[i]['recfine']),
                                        recsentence = tonumber(associated[i]['recsentence']),
                                        time = associated[i]['Time'],
                                        officersinvolved = officers,
                                        civsinvolved = civilians
                                    }
                                    sendIncidentToDiscord(3989503, "MDT Incident Report", message, "ps-mdt | Edited by Lexinor", associatedData)                                
                                end
                            else
                                print('No incident found in the mdt_incidents table with id: ' .. infoResult)
                            end
                        end)
                        
                        for i=1, #associated do
                            MySQL.insert('INSERT INTO `mdt_convictions` (`identifier`, `linkedincident`, `warrant`, `guilty`, `processed`, `associated`, `charges`, `fine`, `sentence`, `recfine`, `recsentence`, `time`) VALUES (:identifier, :linkedincident, :warrant, :guilty, :processed, :associated, :charges, :fine, :sentence, :recfine, :recsentence, :time)', {
                                identifier = associated[i]['identifier'],
                                linkedincident = infoResult,
                                warrant = associated[i]['Warrant'],
                                guilty = associated[i]['Guilty'],
                                processed = associated[i]['Processed'],
                                associated = associated[i]['Isassociated'],
                                charges = json.encode(associated[i]['Charges']),
                                fine = tonumber(associated[i]['Fine']),
                                sentence = tonumber(associated[i]['Sentence']),
                                recfine = tonumber(associated[i]['recfine']),
                                recsentence = tonumber(associated[i]['recsentence']),
                                time = time,
                                officersinvolved = officers,
                                civsinvolved = civilians
                            })
                        end
                        TriggerClientEvent('mdt:client:updateIncidentDbId', src, infoResult)
                    end
                end)
            elseif id > 0 then
                MySQL.Async.fetchAll('SELECT `author`, `title`, `details` FROM `mdt_incidents` WHERE `id` = @id', { ['@id'] = id }, function(result)
                    if result and #result > 0 then
                        local message = generateMessageFromResult(result)
                        
                        for i=1, #associated do
                            local associatedData = {
                                identifier = associated[i]['identifier'],
                                linkedincident = associated[i]['LinkedIncident'],
                                warrant = associated[i]['Warrant'],
                                guilty = associated[i]['Guilty'],
                                processed = associated[i]['Processed'],
                                associated = associated[i]['Isassociated'],
                                charges = json.encode(associated[i]['Charges']),
                                fine = tonumber(associated[i]['Fine']),
                                sentence = tonumber(associated[i]['Sentence']),
                                recfine = tonumber(associated[i]['recfine']),
                                recsentence = tonumber(associated[i]['recsentence']),
                                time = associated[i]['Time'],
                                officersinvolved = officers,
                                civsinvolved = civilians
                            }
                            sendIncidentToDiscord(16711680, "MDT Incident Report has been Updated", message, "ps-mdt | Edited by Lexinor", associatedData)
                        end
                    else
                        print('No incident found in the mdt_incidents table with id: ' .. id)
                    end
                end)

                MySQL.Async.execute('UPDATE `mdt_incidents` SET `title` = @title, `details` = @details, `tags` = @tags, `officersinvolved` = @officersinvolved, `civsinvolved` = @civsinvolved, `evidence` = @evidence, `time` = @time WHERE `id` = @id',
                {
                    ['@id'] = id,
                    ['@title'] = title,
                    ['@details'] = information,
                    ['@tags'] = json.encode(tags),
                    ['@officersinvolved'] = json.encode(officers),
                    ['@civsinvolved'] = json.encode(civilians),
                    ['@evidence'] = json.encode(evidence),
                    ['@time'] = time,
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        --print('Updated incident' .. id)
                    else
                        print('Failed to update incident with id: ' .. id)
                    end
                end)

                for i=1, #associated do
                    TriggerEvent('mdt:server:handleExistingConvictions', associated[i], id, time)
                end
            end
        end
    end
end)

RegisterNetEvent('mdt:server:handleExistingConvictions', function(data, incidentId, time)
	MySQL.query('SELECT * FROM mdt_convictions WHERE identifier=:identifier AND linkedincident=:linkedincident', {
		identifier = data['identifier'],
		linkedincident = incidentId
	}, function(convictionRes)
		if convictionRes and convictionRes[1] and convictionRes[1]['id'] then
			MySQL.update('UPDATE mdt_convictions SET identifier=:identifier, linkedincident=:linkedincident, warrant=:warrant, guilty=:guilty, processed=:processed, associated=:associated, charges=:charges, fine=:fine, sentence=:sentence, recfine=:recfine, recsentence=:recsentence WHERE identifier=:identifier AND linkedincident=:linkedincident', {
				identifier = data['identifier'],
				linkedincident = incidentId,
				warrant = data['Warrant'],
				guilty = data['Guilty'],
				processed = data['Processed'],
				associated = data['Isassociated'],
				charges = json.encode(data['Charges']),
				fine = tonumber(data['Fine']),
				sentence = tonumber(data['Sentence']),
				recfine = tonumber(data['recfine']),
				recsentence = tonumber(data['recsentence']),
			})
		else
			MySQL.insert('INSERT INTO `mdt_convictions` (`identifier`, `linkedincident`, `warrant`, `guilty`, `processed`, `associated`, `charges`, `fine`, `sentence`, `recfine`, `recsentence`, `time`) VALUES (:identifier, :linkedincident, :warrant, :guilty, :processed, :associated, :charges, :fine, :sentence, :recfine, :recsentence, :time)', {
				identifier = data['identifier'],
				linkedincident = incidentId,
				warrant = data['Warrant'],
				guilty = data['Guilty'],
				processed = data['Processed'],
				associated = data['Isassociated'],
				charges = json.encode(data['Charges']),
				fine = tonumber(data['Fine']),
				sentence = tonumber(data['Sentence']),
				recfine = tonumber(data['recfine']),
				recsentence = tonumber(data['recsentence']),
				time = time
			})
		end
	end)
end)

RegisterNetEvent('mdt:server:removeIncidentCriminal', function(identifier, incident)
	MySQL.update('DELETE FROM mdt_convictions WHERE identifier=:identifier AND linkedincident=:linkedincident', {
		identifier = identifier,
		linkedincident = incident
	})
end)

-- Dispatch

RegisterNetEvent('mdt:server:setWaypoint', function(callid)
	local src = source
	local Player = ESX.GetPlayerFromId(source)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			if isDispatchRunning then
				TriggerClientEvent('mdt:client:setWaypoint', src, calls[callid])
			end
		end
	end
end)

RegisterNetEvent('mdt:server:callDetach', function(callid)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local playerdata = {
		fullname = xPlayer.name,
		job = xPlayer.job,
		identifier = xPlayer.identifier,
		callsign = Player(xPlayer.source).state?.callsign,
	}
	local JobType = GetJobType(xPlayer.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			TriggerEvent('dispatch:removeUnit', callid, playerdata, function(newNum)
				TriggerClientEvent('mdt:client:callDetach', -1, callid, newNum)
			end)
		end
	end
end)

RegisterNetEvent('mdt:server:callAttach', function(callid)
	local src = source
	local plyState = Player(src).state
	local Radio = plyState.radioChannel or 0
	local xPlayer = ESX.GetPlayerFromId(src)
	local playerdata = {
		fullname = xPlayer.name,
		job = xPlayer.job,
		identifier = xPlayer.identifier,
		callsign = Player(xPlayer.source).state?.callsign or "000",
		radio = Radio
	}
	print(json.encode(playerdata))
	local JobType = GetJobType(xPlayer.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			TriggerEvent('dispatch:addUnit', callid, playerdata, function(newNum)
				TriggerClientEvent('mdt:client:callAttach', -1, callid, newNum)
			end)
		end
	end

end)

RegisterNetEvent('mdt:server:attachedUnits', function(callid)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			if isDispatchRunning then
				
				TriggerClientEvent('mdt:client:attachedUnits', src, calls[callid]['units'], callid)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:callDispatchDetach', function(callid, identifier)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local playerdata = {
		fullname = Player.name,
		job = Player.PlayerData.job,
		identifier = Player.identifier,
		callsign = Player(Player.source).state?.callsign
	}
	local callid = tonumber(callid)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			TriggerEvent('dispatch:removeUnit', callid, playerdata, function(newNum)
				TriggerClientEvent('mdt:client:callDetach', -1, callid, newNum)
			end)
		end
	end
end)

RegisterNetEvent('mdt:server:setDispatchWaypoint', function(callid, identifier)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local callid = tonumber(callid)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			if isDispatchRunning then
				
				TriggerClientEvent('mdt:client:setWaypoint', src, calls[callid])
			end
		end
	end

end)

RegisterNetEvent('mdt:server:callDragAttach', function(callid, identifier)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	local playerdata = {
		name = Player.name,
		job = Player.job.name,
		identifier = Player.identifier,
		callsign = Player(Player.source).state?.callsign
	}
	local callid = tonumber(callid)
	local JobType = GetJobType(Player.job.name)
	if JobType == 'police' or JobType == 'ambulance' then
		if callid then
			TriggerEvent('dispatch:addUnit', callid, playerdata, function(newNum)
				TriggerClientEvent('mdt:client:callAttach', -1, callid, newNum)
			end)
		end
	end
end)

RegisterNetEvent('mdt:server:setWaypoint:unit', function(identifier)
	local src = source
	local Player = ESX.GetPlayerFromIdentifier(identifier)
	local PlayerCoords = GetEntityCoords(GetPlayerPed(Player.source))
	TriggerClientEvent("mdt:client:setWaypoint:unit", src, PlayerCoords)
end)

-- Dispatch chat

RegisterNetEvent('mdt:server:sendMessage', function(message, time)
	if message and time then
		local src = source
		local xPlayer = ESX.GetPlayerFromId(src)
		if xPlayer then
			MySQL.scalar("SELECT pfp FROM `mdt_data` WHERE identifier=:id LIMIT 1", {
				id = xPlayer.identifier -- % wildcard, needed to search for all alike results
			}, function(data)
				if data == "" then data = nil end
				local ProfilePicture = ProfPic(xPlayer.sex, data)
				local callsign = Player(xPlayer.source).state?.callsign or "000"
				local Item = {
					profilepic = ProfilePicture,
					callsign = callsign,
					identifier = xPlayer.identifier,
					--name = ("[%s] %s %s %s"):format(callsign, xPlayer.job.grade_label, xPlayer.get('firstName'), xPlayer.get('lastName')),
					name = ("[%s] %s %s"):format(callsign, xPlayer.job.grade_label, xPlayer.get('lastName')),
					message = message,
					time = time,
					job = xPlayer.job.name
				}
				dispatchMessages[#dispatchMessages+1] = Item
				TriggerClientEvent('mdt:client:dashboardMessage', -1, Item)
			end)
		end
	end
end)

RegisterNetEvent('mdt:server:refreshDispatchMsgs', function()
	local src = source
	local PlayerData = ESX.GetPlayerFromId(src)
	if IsJobAllowedToMDT(PlayerData.job.name) then
		TriggerClientEvent('mdt:client:dashboardMessages', src, dispatchMessages)
	end
end)

RegisterNetEvent('mdt:server:getCallResponses', function(callid)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if IsPoliceOrEms(Player.job.name) then
		if isDispatchRunning then
			
			TriggerClientEvent('mdt:client:getCallResponses', src, calls[callid]['responses'], callid)
		end
	end
end)

RegisterNetEvent('mdt:server:sendCallResponse', function(message, time, callid)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if IsPoliceOrEms(Player.job.name) then
		TriggerEvent('dispatch:sendCallResponse', src, callid, message, time, function(isGood)
			if isGood then
				TriggerClientEvent('mdt:client:sendCallResponse', -1, message, time, callid, Player.name)
			end
		end)
	end
end)

RegisterNetEvent('mdt:server:setRadio', function(identifier, newRadio)
	local src = source
	local targetPlayer = ESX.GetPlayerFromIdentifier(identifier)

	local radio = targetPlayer.Functions.GetItemByName("radio")
	if radio ~= nil then
		TriggerClientEvent('mdt:client:setRadio', targetPlayer.source, newRadio)
	else
		TriggerClientEvent('esx:showAdvancedNotification', src, targetPlayer.name..' does not have a radio!', 'error')
	end
end)

local function isRequestVehicle(vehId)
	local found = false
	for i=1, #impound do
		if impound[i]['vehicle'] == vehId then
			found = true
			impound[i] = nil
			break
		end
	end
	return found
end
exports('isRequestVehicle', isRequestVehicle)

RegisterNetEvent('mdt:server:impoundVehicle', function(sentInfo, sentVehicle)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		if GetJobType(Player.job.name) == 'police' then
			if sentInfo and type(sentInfo) == 'table' then
				local plate, linkedreport, fee, time = sentInfo['plate'], sentInfo['linkedreport'], sentInfo['fee'], sentInfo['time']
				if (plate and linkedreport and fee and time) then
				local vehicle = MySQL.query.await("SELECT id, plate FROM `player_vehicles` WHERE plate=:plate LIMIT 1", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1") })
					if vehicle and vehicle[1] then
						local data = vehicle[1]
						MySQL.insert('INSERT INTO `mdt_impound` (`vehicleid`, `linkedreport`, `fee`, `time`) VALUES (:vehicleid, :linkedreport, :fee, :time)', {
							vehicleid = data['id'],
							linkedreport = linkedreport,
							fee = fee,
							time = os.time() + (time * 60)
						}, function(res)
							local data = {
								vehicleid = data['id'],
								plate = plate,
								beingcollected = 0,
								vehicle = sentVehicle,
								officer = Player.name,
								number = "",
								time = os.time() * 1000,
								src = src,
							}
							local vehicle = NetworkGetEntityFromNetworkId(sentVehicle)
							FreezeEntityPosition(vehicle, true)
							impound[#impound+1] = data

							TriggerClientEvent("police:client:ImpoundVehicle", src, true, fee)
						end)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('mdt:server:getImpoundVehicles', function()
	TriggerClientEvent('mdt:client:getImpoundVehicles', source, impound)
end)

RegisterNetEvent('mdt:server:removeImpound', function(plate, currentSelection)
	print("Removing impound", plate, currentSelection)
	local src = source
	local Player = ESX.GetPlayerFromId(src)
	if Player then
		if GetJobType(Player.job.name) == 'police' then
			local result = MySQL.single.await("SELECT id, vehicle FROM `player_vehicles` WHERE plate=:plate LIMIT 1", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1")})
			if result and result[1] then
				local data = result[1]
				MySQL.update("DELETE FROM `mdt_impound` WHERE vehicleid=:vehicleid", { vehicleid = data['id'] })
				TriggerClientEvent('police:client:TakeOutImpound', src, currentSelection)
			end
		end
	end
end)

RegisterNetEvent('mdt:server:statusImpound', function(plate)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if Player then
		if GetJobType(Player.job.name) == 'police' then
			local vehicle = MySQL.query.await("SELECT id, plate FROM `player_vehicles` WHERE plate=:plate LIMIT 1", { plate = string.gsub(plate, "^%s*(.-)%s*$", "%1")})
			if vehicle and vehicle[1] then
				local data = vehicle[1]
				local impoundinfo = MySQL.query.await("SELECT * FROM `mdt_impound` WHERE vehicleid=:vehicleid LIMIT 1", { vehicleid = data['id'] })
				if impoundinfo and impoundinfo[1] then
					TriggerClientEvent('mdt:client:statusImpound', src, impoundinfo[1], plate)
				end
			end
		end
	end
end)

RegisterServerEvent("mdt:server:AddLog", function(text)
	AddLog(text)
end)

function GetBoloStatus(plate)

    local result = MySQL.query.await("SELECT * FROM mdt_bolos where plate = @plate", {['@plate'] = plate})
	if result and result[1] then
		local title = result[1]['title']
		local boloId = result[1]['id']
		return true, title, boloId
	end

	return false
end

function GetWarrantStatus(plate)
    local result = MySQL.query.await("SELECT p.plate, p.identifier, m.id FROM player_vehicles p INNER JOIN mdt_convictions m ON p.identifier = m.identifier WHERE m.warrant =1 AND p.plate =?", {plate})
	if result and result[1] then
		local identifier = result[1]['identifier']
		local Player = ESX.GetPlayerFromIdentifier(identifier)
		local owner = Player.name
		local incidentId = result[1]['id']
		return true, owner, incidentId
	end
	return false
end

function GetVehicleInformation(plate)
	local result = MySQL.query.await('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
    if result[1] then
        return result[1]
    else
        return false
    end
end

function GetVehicleOwner(plate)

	local result = MySQL.query.await('SELECT plate, identifier, id FROM player_vehicles WHERE plate = @plate', {['@plate'] = plate})
	if result and result[1] then
		local identifier = result[1]['identifier']
		local Player = ESX.GetPlayerFromIdentifier(identifier)
		local owner = Player.name
		return owner
	end
end

-- Returns the source for the given identifier
lib.callback.register('mdt:server:GetPlayerSourceId', function(source, targetCitizenId)
    local targetPlayer = ESX.GetPlayerFromIdentifier(targetCitizenId)
    if targetPlayer == nil then 
        TriggerClientEvent('esx:showNotification', source, "Citizen seems Asleep / Missing", "error")
        return
    end
    local targetSource = targetPlayer.PlayerData.source

    return targetSource
end)

lib.callback.register('getWeaponInfo', function(source)
    local Player = ESX.GetPlayerFromId(source)
    local weaponInfos = {}
	if Config.InventoryForWeaponsImages == "ox_inventory" then
		local inv = exports.ox_inventory:GetInventoryItems(source)
		for _, item in pairs(inv) do
			if string.find(item.name, "WEAPON_") then
				local invImage = ("https://cfx-nui-ox_inventory/web/images/%s.png"):format(item.name)
				if invImage then
					weaponInfo = {
						serialnumber = item.metadata.serial,
						owner = Player.name,
						weaponmodel = Items[string.lower(item.name)].label,
						weaponurl = invImage,
						notes = "Self Registered",
						weapClass = "Class 1",
					}
					break
				end
			end
		end
	else -- qb/lj
		for _, item in pairs(Player.PlayerData.items) do
			if item.type == "weapon" then
				local invImage = ("https://cfx-nui-%s/html/images/%s"):format(Config.InventoryForWeaponsImages, item.image)
				if invImage then
					local weaponInfo = {
						serialnumber = item.info.serie,
						owner = Player.name,
						weaponmodel = Items[item.name].label,
						weaponurl = invImage,
						notes = "Self Registered",
						weapClass = "Class 1",
					}
					table.insert(weaponInfos, weaponInfo)
				end
			end
		end	
	end
    return weaponInfos
end)

RegisterNetEvent('mdt:server:registerweapon', function(serial, imageurl, notes, owner, weapClass, weapModel) 
    exports['ps-mdt']:CreateWeaponInfo(serial, imageurl, notes, owner, weapClass, weapModel)
end)

local function giveCitationItem(src, identifier, fine, incidentId)
	local Player = ESX.GetPlayerFromIdentifier(identifier)
	local PlayerName = PlayerData.name
	local Officer = ESX.GetPlayerFromId(src)
	local OfficerFullName = '(' .. Officer.PlayerData.metadata.callsign .. ') ' .. Officer.PlayerData.charinfo.firstname .. ' ' .. Officer.PlayerData.charinfo.lastname
	local info = {}
	local date = os.date("%Y-%m-%d %H:%M")
	if Config.InventoryForWeaponsImages == "ox_inventory" then
		info = {
			description = {
				'Citizen ID: ' .. identifier '  \n',
				'Fine: $ ' .. fine '  \n',
				'Date: ' .. date '  \n',
				'Incitent ID: # ' .. incidentId '  \n',
				'Officer: ' .. OfficerFullName
			}
		}
	else
		info = {
			identifier = identifier,
			fine = "$"..fine,
			date = date,
			incidentId = "#"..incidentId,
			officer = OfficerFullName,
		}
	end
	Player.Functions.AddItem('mdtcitation', 1, false, info)
	TriggerClientEvent('esx:showNotification', src, PlayerName.." (" ..identifier.. ") received a citation!")
	if Config.QBManagementUse then 
		exports['qb-management']:AddMoney(Officer.PlayerData.job.name, fine) 
	end
	TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, Items['mdtcitation'], "add")
	TriggerEvent('mdt:server:AddLog', "A Fine was writen by "..OfficerFullName.." and was sent to "..PlayerName..", the Amount was $".. fine ..". (ID: "..incidentId.. ")")
end

-- Removes money from the players bank and gives them a citation item
RegisterNetEvent('mdt:server:removeMoney', function(identifier, fine, incidentId)
	local src = source
	local Player = ESX.GetPlayerFromIdentifier(identifier)
	
	if not antiSpam then
		if Player.Functions.RemoveMoney('bank', fine, 'lspd-fine') then
			TriggerClientEvent('esx:showNotification', Player.PlayerData.source, fine.."$ was removed from your bank!")
			giveCitationItem(src, identifier, fine, incidentId)
		else
			TriggerClientEvent('esx:showNotification', Player.PlayerData.source, "Something went wrong!")
		end
		antiSpam = true
		SetTimeout(60000, function()
			antiSpam = false
		end)
	else
		TriggerClientEvent('esx:showNotification', src, "On cooldown!")
	end
end)

-- Gives the player a citation item
RegisterNetEvent('mdt:server:giveCitationItem', function(identifier, fine, incidentId)
	local src = source
	giveCitationItem(src, identifier, fine, incidentId)
end)

function getTopOfficers(callback)
    local result = {}
    local query = 'SELECT * FROM mdt_clocking ORDER BY total_time DESC LIMIT 25'
    MySQL.Async.fetchAll(query, {}, function(officers)
        for k, officer in ipairs(officers) do
            table.insert(result, {
                rank = k,
                name = officer.firstname .. " " .. officer.lastname,
                callsign = officer.user_id,
                totalTime = format_time(officer.total_time)
            })
        end
        callback(result)
    end)
end

RegisterServerEvent("mdt:requestOfficerData")
AddEventHandler("mdt:requestOfficerData", function()
    local src = source
    getTopOfficers(function(officerData)
        TriggerClientEvent("mdt:receiveOfficerData", src, officerData)
    end)
end)

function sendToDiscord(color, name, message, footer)
	if ClockinWebhook == '' then
		print("\27[31mA webhook is missing in: ClockinWebhook (server > main.lua > line 20)\27[0m")
	else
		local embed = {
			{
				color = color,
				title = "**".. name .."**",
				description = message,
				footer = {
					text = footer,
				},
			}
		}
	
		PerformHttpRequest(ClockinWebhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end

function sendIncidentToDiscord(color, name, message, footer, associatedData)
    local rolePing = "<@&1074119792258199582>" -- DOJ role to be pigned when the person is not Guilty.
    local pingMessage = ""

    if IncidentWebhook == '' then
        print("\27[31mA webhook is missing in: IncidentWebhook (server > main.lua > line 24)\27[0m")
    else
        if associatedData then
            message = message .. "\n\n--- Associated Data ---"
            message = message .. "\nCID: " .. (associatedData.identifier or "Not Found")
            
            if associatedData.guilty == false then
                pingMessage = "**Guilty: Not Guilty - Need Court Case** " .. rolePing
                message = message .. "\n" .. pingMessage
            else
                message = message .. "\nGuilty: " .. tostring(associatedData.guilty or "Not Found")
            end
			
			
            if associatedData.officersinvolved and #associatedData.officersinvolved > 0 then
                local officersList = table.concat(associatedData.officersinvolved, ", ")
                message = message .. "\nOfficers Involved: " .. officersList
            else
                message = message .. "\nOfficers Involved: None"
            end

            if associatedData.civsinvolved and #associatedData.civsinvolved > 0 then
                local civsList = table.concat(associatedData.civsinvolved, ", ")
                message = message .. "\nCivilians Involved: " .. civsList
            else
                message = message .. "\nCivilians Involved: None"
            end


            message = message .. "\nWarrant: " .. tostring(associatedData.warrant or "No Warrants")
            message = message .. "\nReceived Fine: $" .. tostring(associatedData.fine or "Not Found")
            message = message .. "\nReceived Sentence: " .. tostring(associatedData.sentence or "Not Found")
            message = message .. "\nRecommended Fine: $" .. tostring(associatedData.recfine or "Not Found")
            message = message .. "\nRecommended Sentence: " .. tostring(associatedData.recsentence or "Not Found")

            local chargesTable = json.decode(associatedData.charges)
            if chargesTable and #chargesTable > 0 then
                local chargeList = table.concat(chargesTable, "\n")
                message = message .. "\n**Charges:** \n" .. chargeList
            else
                message = message .. "\n**Charges: No Charges**"
            end
        end

        local embed = {
            {
                color = color,
                title = "**".. name .."**",
                description = message,
                footer = {
                    text = footer,
                },
            }
        }

        PerformHttpRequest(IncidentWebhook, function(err, text, headers) end, 'POST', json.encode({content = pingMessage, username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })	
    end
end

function format_time(time)
    local days = math.floor(time / 86400)
    time = time % 86400
    local hours = math.floor(time / 3600)
    time = time % 3600
    local minutes = math.floor(time / 60)
    local seconds = time % 60

    local formattedTime = ""
    if days > 0 then
        formattedTime = string.format("%d jour%s ", days, days == 1 and "" or "s")
    end
    if hours > 0 then
        formattedTime = formattedTime .. string.format("%d heure%s ", hours, hours == 1 and "" or "s")
    end
    if minutes > 0 then
        formattedTime = formattedTime .. string.format("%d minute%s ", minutes, minutes == 1 and "" or "s")
    end
    if seconds > 0 then
        formattedTime = formattedTime .. string.format("%d seconde%s", seconds, seconds == 1 and "" or "s")
    end
    return formattedTime
end

function GetPlayerPropertiesByCitizenId(identifier)
    local properties = {}

    local result = MySQL.Sync.fetchAll("SELECT * FROM properties WHERE owner_citizenid = @identifier", {
        ['@identifier'] = identifier
    })

    if result and #result > 0 then
        for i = 1, #result do
            table.insert(properties, result[i])
        end
    end

    return properties
end

function generateMessageFromResult(result)
    local author = result[1].author
    local title = result[1].title
    local details = result[1].details
    details = details:gsub("<[^>]+>", ""):gsub("&nbsp;", "")
    local message = "Author: " .. author .. "\n"
    message = message .. "Title: " .. title .. "\n"
    message = message .. "Details: " .. details
    return message
end

lib.cron.new('*/15 * * * *', function()
	for k, msg in pairs(dispatchMessages) do
		local xPlayer = ESX.GetPlayerFromIdentifier(msg.identifier)
		msg.name = ("[%s] %s %s"):format(Player(xPlayer.source).state.callsign, xPlayer.job.grade_label, xPlayer.get('lastName'))
		msg.callsign = Player(xPlayer.source).state.callsign
	end
	TriggerClientEvent('mdt:client:dashboardMessages', -1, dispatchMessages)
end)