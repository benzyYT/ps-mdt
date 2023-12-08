local PlayerData = {}
local mugshotInProgress, createdCamera, MugshotArray, playerData = false, 0, {}, nil
local handle, board, board_scaleform, overlay, ped, pedcoords, x, y, z, r, suspectheading, suspectx, suspecty, suspectz, board_pos
local MugShots = {}

-- Mugshot location  ( Position is the default QBCore Prison Interior )
	
	-- 477.4782, -984.8716, 21.5595, 269.2493
    -- 479.0509, -984.8743, 21.5595, 88.1577
-- Mugshot functions

local function TakeMugShot()
    local MugShotWebhook = lib.callback.await('ps-mdt:server:MugShotWebhook', false)

    if MugShotWebhook then
        exports['screenshot-basic']:requestScreenshotUpload(MugShotWebhook, 'files[]', {encoding = 'jpg'}, function(data)
            local resp = json.decode(data)
            table.insert(MugshotArray, resp.attachments[1].url)
        end)
    end
end

local function PhotoProcess(ped, spot)
    local rotation = spot.suspectHeading
    for photo = 1, Config.MugPhotos, 1 do
        Wait(1500)
        TakeMugShot()
        PlaySoundFromCoord(-1, "SHUTTER_FLASH", x, y, z, "CAMERA_FLASH_SOUNDSET", true, 5, 0)
        Wait(1500)
        rotation = rotation - 90.0
        SetEntityHeading(ped, rotation)
    end
end

local function MugShotCamera(spot)
    if createdCamera ~= 0 then
        DestroyCam(createdCamera, 0)
        createdCamera = 0
    end
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, spot.camX, spot.camY, spot.camZ)
    SetCamRot(cam, spot.camRot.x, spot.camRot.y, spot.camRot.z, 2)
    RenderScriptCams(1, 0, 0, 1, 1)
    Wait(250)
    createdCamera = cam
    CreateThread(function()
        FreezeEntityPosition(ped, true)
        SetPauseMenuActive(false)
        while mugshotInProgress do
            DisableAllControlActions(0)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 46, true)
            Wait(1)
        end
    end)
end

local function CreateNamedRenderTargetForModel(name, model)
	local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end
	return handle
end

local function LoadScaleform (scaleform)
	local handle = RequestScaleformMovie(scaleform)
	if handle ~= 0 then
		while not HasScaleformMovieLoaded(handle) do
			Wait(0)
		end
	end
	return handle
end

local function CallScaleformMethod (scaleform, method, ...)
	local t
	local args = { ... }
	BeginScaleformMovieMethod(scaleform, method)
	for k, v in ipairs(args) do
		t = type(v)
		if t == 'string' then
			PushScaleformMovieMethodParameterString(v)
		elseif t == 'number' then
			if string.match(tostring(v), "%.") then
				PushScaleformMovieFunctionParameterFloat(v)
			else
				PushScaleformMovieFunctionParameterInt(v)
			end
		elseif t == 'boolean' then
			PushScaleformMovieMethodParameterBool(v)
		end
	end
	EndScaleformMovieMethod()
end

local function PrepBoard()
    CreateThread(function()
        board_scaleform = LoadScaleform("mugshot_board_01")
        handle = CreateNamedRenderTargetForModel("ID_Text", `prop_police_id_text`)
        while handle do
            HideHudAndRadarThisFrame()
            SetTextRenderId(handle)
            Set_2dLayer(4)
            SetScriptGfxDrawBehindPausemenu(1)
            DrawScaleformMovie(board_scaleform, 0.405, 0.37, 0.81, 0.74, 255, 255, 255, 255, 0)
            SetScriptGfxDrawBehindPausemenu(0)
            SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            SetScriptGfxDrawBehindPausemenu(1)
            SetScriptGfxDrawBehindPausemenu(0)
            Wait(0)
        end
    end)
end

local function MakeBoard(label)
    title = label
    center = ESX.PlayerData.name
    footer = ESX.PlayerData.identifier
    header = ESX.PlayerData.dateofbirth
	CallScaleformMethod(board_scaleform, 'SET_BOARD', title, center, footer, header, 0, 1337, 116)
end

local function PlayerBoard()
	RequestModel(`prop_police_id_board`)
	RequestModel(`prop_police_id_text`)
	while not HasModelLoaded(`prop_police_id_board`) or not HasModelLoaded(`prop_police_id_text`) do
        Wait(1)
    end
	board = CreateObject(`prop_police_id_board`, pedcoords, true, true, false)
	overlay = CreateObject(`prop_police_id_text`, pedcoords, true, true, false)
	AttachEntityToEntity(overlay, board, -1, 4103, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
	SetModelAsNoLongerNeeded(`prop_police_id_board`)
	SetModelAsNoLongerNeeded(`prop_police_id_text`)
    SetCurrentPedWeapon(ped, `weapon_unarmed`, 1)
	ClearPedWetness(ped)
	ClearPedBloodDamage(ped)
	AttachEntityToEntity(board, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
end

local function DestoryCamera()
    DestroyCam(createdCamera, 0)
    RenderScriptCams(0, 0, 1, 1, 1)
    SetFocusEntity(GetPlayerPed(ped))
    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, false)
    DeleteObject(overlay)
    DeleteObject(board)
    handle = nil
    createdCamera = 0
end

RegisterNetEvent('cqc-mugshot:client:trigger', function(spot)
    ped = PlayerPedId()
    pedcoords = GetEntityCoords(ped)
    print(spot)
    if not spot then
        spot = Config.MugShotSpots["missionrow"]
    else
        spot = Config.MugShotSpots[spot]
    end
    CreateThread(function()
        playerData = ESX.GetPlayerData()
        MugshotArray, mugshotInProgress = {}, true
        local identifier = playerData.identifier
        local animDict = 'mp_character_creation@lineup@male_a'
        lib.requestAnimDict(animDict)
        PrepBoard()
        Wait(250)
        MakeBoard(spot.signLabel)
        MugShotCamera(spot)
        SetEntityCoords(ped, spot.suspectX, spot.suspectY, spot.suspectZ)
        SetEntityHeading(ped, spot.suspectHeading)
        PlayerBoard()
        TaskPlayAnim(ped, animDict, "loop_raised", 8.0, 8.0, -1, 49, 0, false, false, false)
        PhotoProcess(ped, spot)
        if createdCamera ~= 0 then
            DestoryCamera()
            SetEntityHeading(ped, spot.suspectHeading)
            ClearPedSecondaryTask(GetPlayerPed(ped))
        end
           TriggerServerEvent('psmdt-mugshot:server:MDTupload', playerData.identifier, MugshotArray)
        mugshotInProgress = false
    end)
end)

-- RegisterNUICallback("sendToJail", function(data, cb)
--     local MugShotWebhook = lib.callback.await('ps-mdt:server:MugShotWebhook', false)
--     if MugShotWebhook then
--         local identifier, sentence = data.identifier, data.sentence

--         -- Gets the player id from the identifier
--         local targetSourceId = lib.callback.await('mdt:server:GetPlayerSourceId', false, identifier)

--         if targetSourceId then
--             if sentence > 0 then
--                 if Config.UseCQCMugshot then
--                     TriggerServerEvent('cqc-mugshot:server:triggerSuspect', targetSourceId)
--                 end
--                 Citizen.Wait(5000)
--                 -- Uses qb-policejob JailPlayer event
--                 TriggerServerEvent("police:server:JailPlayer", targetSourceId, sentence)
--             end
--         end
--     end
-- end)

RegisterCommand("testmugshotself", function(source)
    if Config.UseCQCMugshot then
        TriggerServerEvent('cqc-mugshot:server:triggerSuspect', GetPlayerServerId(PlayerId()))
    end
end, false)
