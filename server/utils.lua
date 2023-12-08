function GetPlayerData(source)
	local Player = ESX.GetPlayerFromId(source)
	if Player == nil then return end -- Player not loaded in correctly
	return Player
end

function UnpackJob(_job)
	local job = {
		name = _job.name,
		label = _job.label
	}
	local grade = {
		name = _job.grade_label,
	}

	return job, grade
end

function PermCheck(src, PlayerData)
	local result = true

	if not Config.AllowedJobs[PlayerData.job.name] then
		print(("UserId: %s(%d) tried to access the mdt even though they are not authorised (server direct)"):format(GetPlayerName(src), src))
		result = false
	end

	return result
end

function ProfPic(gender, profilepic)
	if profilepic and profilepic ~= "" then return profilepic end;
	if gender == "f" then return "img/female.png" end;
	return "img/male.png"
end

function GetNameFromPlayerData(PlayerData)
	return ('%s %s'):format(PlayerData.charinfo.firstname, PlayerData.charinfo.lastname)
end

function GetVehicleHashByName(hash)
	return HASHTOVEHICLE[hash]
end