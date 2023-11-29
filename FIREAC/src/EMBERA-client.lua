--
-- EmberAC (https://github.com/Julien86580/Emberac-AntiCheat-Fivem)
-- Copyright 2023-2028 by Julien&Julie Vendeta(Masturlute) (https://github.com/Julien86580/)
-- Licensed under the GNU Affero General Public License v3.0
--

local SPAWN = false
local CHECK_SPAWN = true
local TRACK = 0
local WHITELIST = false

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or IsPlayerSwitchInProgress() do
        Citizen.Wait(0)
    end
    SPAWN = true
    CHECK_SPAWN = false
end)

Citizen.CreateThread(function()
    while true do
        if CHECK_SPAWN and not SPAWN then
            TriggerServerEvent('EMBERAC:CheckIsAdmin')
            Wait(10000)
            SPAWN = true
            CHECK_SPAWN = false
            break
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local doesPlayerExist = DoesEntityExist(playerPed)
        local isPlayerInVehicle = IsPedInAnyVehicle(playerPed, false)
        local isSpawned = SPAWN
        local isPlayerSwitchInProgress = IsPlayerSwitchInProgress()
        local isCameraControlDisabled = IsPlayerCamControlDisabled()

        if EMBERAC.AntiTeleport and not isPlayerInVehicle and isSpawned and not isPlayerSwitchInProgress and not isCameraControlDisabled then
            local currentPosition = GetEntityCoords(playerPed)
            Citizen.Wait(3000)
            local newPlayerPed = PlayerPedId()
            local newPosition = GetEntityCoords(newPlayerPed)
            local distance = #(vector3(currentPosition) - vector3(newPosition))

            if distance > EMBERAC.MaxFootDistance and not IsEntityDead(playerPed) and not IsPedInParachuteFreeFall(playerPed) and not IsPedJumpingOutOfVehicle(playerPed) and playerPed == newPlayerPed then
                EMBERAC_ACTION(EMBERAC.TeleportPunishment, "Anti Teleport",
                    "Used teleport hacks")
            end
        end

        if EMBERAC.AntiSuperJump and doesPlayerExist and isSpawned and not isPlayerSwitchInProgress then
            local isJumping = IsPedJumping(playerPed)

            if isJumping then
                TriggerServerEvent('EMBERAC:CheckJumping', EMBERAC.JumpPunishment, "Anti Superjump", "Used superjump hacks")
            end
        end
    end
end)

--【 𝗖𝗵𝗲𝗰𝗸 𝗧𝗵r𝗲𝗮𝗱 1 】--
Citizen.CreateThread(function()
    local lastCoords = nil
    local isFirstAttempt = true
    while true do
        Wait(5000)
        local PED     = PlayerPedId()
        local COORDS  = GetEntityCoords(PED)
        local PLS     = GetActivePlayers()
        local HEALTH  = GetEntityHealth(PED)
        local ARMOR   = GetPedArmour(PED)
        local VEH     = nil
        local PLATE   = nil
        local VEHHASH = nil
        if not IsPlayerSwitchInProgress() then
            if IsPedInAnyVehicle(PED, false) then
                VEH     = GetVehiclePedIsIn(PED, false)
                PLATE   = GetVehicleNumberPlateText(VEH)
                VEHHASH = GetHashKey(VEH)
            end
            if EMBERAC.AntiSpectate then
                if NetworkIsInSpectatorMode() then
                    EMBERAC_ACTION(EMBERAC.SpectatePunishment, "Anti Spectate",
                        "Spectated another player")
                end
            end
            if EMBERAC.AntiTrackPlayer then
                local playerPed = PlayerPedId()
                local trackCount = 0
                for i = 0, 255 do
                    if NetworkIsPlayerActive(i) and i ~= PlayerId() then
                        local otherPlayerPed = GetPlayerPed(i)
                        local otherPlayerBlip = GetBlipFromEntity(otherPlayerPed)
                        if DoesBlipExist(otherPlayerBlip) then
                            local blipInfo = GetBlipInfoIdCoord(otherPlayerBlip)
                            local isSelfPlayerBlip = (blipInfo.id == 1 and blipInfo.x == GetEntityCoords(playerPed))
                            if not isSelfPlayerBlip then
                                trackCount = trackCount + 1
                            end
                        end
                    end
                end

                if trackCount >= EMBERAC.MaxTrack then
                    EMBERAC_ACTION(EMBERAC.TrackPunishment, "Anti Track Player",
                        "Tracked **" .. trackCount .. "** players")
                end
            end
            if EMBERAC.AntiHealthHack then
                if HEALTH > EMBERAC.MaxHealth then
                    EMBERAC_ACTION(EMBERAC.HealthPunishment, "Anti Health Hack",
                        "Used health hacks : **" .. HEALTH .. "**")
                end
            end
            if EMBERAC.AntiArmorHack then
                if ARMOR > EMBERAC.MaxArmor then
                    EMBERAC_ACTION(EMBERAC.HealthPunishment, "Anti Armor Hack",
                        "Used armor hacks : **" .. ARMOR .. "**")
                end
            end
            if EMBERAC.AntiBlackListWeapon then
                for _, weapon in ipairs(Weapon) do
                    local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
                    if currentWeaponHash == GetHashKey(weapon) then
                        RemoveAllPedWeapons(PlayerPedId(), true)
                        EMBERAC_ACTION(EMBERAC.WeaponPunishment, "Anti Black List Weapon",
                            "Used blacklisted weapon: " .. weapon)
                        break
                    end
                end
            end
            if EMBERAC.AntiGodMode then
                if NetworkIsPlayerActive(PlayerId()) then
                    if not IsNuiFocused() then
                        if IsScreenFadedIn() then
                            local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof =
                                GetEntityProofs(PlayerPedId())
                            if GetPlayerInvincible(PlayerId()) or GetPlayerInvincible_2(PlayerId()) then
                                if SPAWN then
                                    EMBERAC_ACTION(EMBERAC.GodPunishment, "Anti Godmode",
                                        "Used godmode hacks")
                                end
                            end
                            if retval == 1 and bulletProof == 1 and fireProof == 1 and explosionProof == 1 and collisionProof == 1 and steamProof == 1 and p7 == 1 and drownProof == 1 then
                                EMBERAC_ACTION(EMBERAC.GodPunishment, "Anti Godmode",
                                    "Used godmode hacks")
                            end
                            if not GetEntityCanBeDamaged(PlayerPedId()) then
                                EMBERAC_ACTION(EMBERAC.GodPunishment, "Anti Godmode",
                                    "Used godmode hacks")
                            end
                        end
                    end
                end
            end
            if EMBERAC.AntiPlateChanger then
                local ped = PlayerPedId()
                if IsPedInAnyVehicle(ped, false) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    local hash = GetHashKey(vehicle)
                    if plate and hash and VEH == vehicle and PLATE ~= plate then
                        EMBERAC_ACTION(EMBERAC.GodPunishment, "Anti Plate Changer",
                            "Changed the vehicle plate : **" .. PLATE .. " --> " .. plate .. "**")
                    end
                    VEH = vehicle
                    PLATE = plate
                else
                    VEH = nil
                    PLATE = nil
                end
            end
            if EMBERAC.AntiInfiniteStamina then
                if not IsPedInAnyVehicle(PlayerPedId(), true)
                    and not IsPedRagdoll(PlayerPedId())
                    and not IsPedFalling(PlayerPedId())
                    and not IsPedJumpingOutOfVehicle(PlayerPedId())
                    and not IsPedInParachuteFreeFall(PlayerPedId())
                    and GetEntitySpeed(PlayerPedId()) > 7
                then
                    local staminaLevel = GetPlayerSprintStaminaRemaining(PlayerId())
                    if tonumber(staminaLevel) == 0.0 then
                        EMBERAC_ACTION(EMBERAC.InfinitePunishment, "Anti Infinite Stamina",
                            "Used stamina hacks")
                    end
                end
            end
            if EMBERAC.AntiRagdoll then
                if SPAWN and IsPedRagdoll(PlayerPedId()) and not CanPedRagdoll(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true)
                    and not IsEntityDead(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and not IsPedJacking(PlayerPedId()) then
                    EMBERAC_ACTION(EMBERAC.InfinitePunishment, "Anti Ragdoll",
                        "Used ragdoll hack")
                end
            end
            if EMBERAC.AntiNightVision then
                if GetUsingnightvision(true) and not IsPedInAnyHeli(PlayerPedId()) then
                    EMBERAC_ACTION(EMBERAC.VisionPunishment, "Anti Night Vision",
                        "Used night vision hack")
                end
                if GetUsingseethrough(true) and not IsPedInAnyHeli(PlayerPedId()) then
                    EMBERAC_ACTION(EMBERAC.VisionPunishment, "Anti Thermal Vision",
                        "Used thermal vision hack")
                end
            end
            Wait(2000)
            if EMBERAC.AntiInvisible then
                if SPAWN and (not IsEntityVisible(PlayerPedId()) and not IsEntityVisibleToScript(PlayerPedId()))
                    or (GetEntityAlpha(PlayerPedId()) <= 150 and GetEntityAlpha(PlayerPedId()) ~= 0) then
                    Citizen.Wait(1000)
                    EMBERAC_ACTION(EMBERAC.InvisiblePunishment, "Anti Invisble",
                        "Used invisibility hacks")
                end
            end
            if EMBERAC.AntiBlackListPlate then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false), false)
                    for i, plate in ipairs(Plate) do
                        if currentPlate == plate then
                            EMBERAC_ACTION(EMBERAC.PlatePunishment, "Anti Black List Plate",
                                "Used blacklisted plate: " .. plate)
                        end
                    end
                end
            end
            if EMBERAC.AntiRainbowVehicle then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    local VEH = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(VEH) then
                        local C1r, C1g, C1b = GetVehicleCustomPrimaryColour(VEH)
                        if C1r ~= nil then
                            Wait(1000)
                            local C2r, C2g, C2b = GetVehicleCustomPrimaryColour(VEH)
                            if C2r ~= nil and C1r ~= C2r and C1g ~= C2g and C1b ~= C2b then
                                Wait(2000)
                                local C3r, C3g, C3b = GetVehicleCustomPrimaryColour(VEH)
                                if C3r ~= nil and C2r ~= C3r and C3g ~= C2g and C3b ~= C2b and C1r ~= C3r and C1g ~= C3g and C1b ~= C3b then
                                    EMBERAC_ACTION(EMBERAC.RainbowPunishment, "Anti Rainbow",
                                        "Used rainbow hacks")
                                end
                            end
                        end
                    end
                end
            end
            if EMBERAC.AntiNoclip then
                if not IsPedInAnyVehicle(PlayerPedId(), false) then
                    local coords = GetEntityCoords(PlayerPedId())
                    if isFirstAttempt then
                        lastCoords = coords
                        isFirstAttempt = false
                    end

                    if #(coords - lastCoords) > 10.0 and GetEntityHeightAboveGround(PlayerPedId()) > 4.0 and not IsPedFalling(PlayerPedId()) then
                        EMBERAC_ACTION(EMBERAC.NoclipPunishment, "Anti Noclip",
                            "Used noclip hack")
                    end
                    lastCoords = coords
                end
            end
            if EMBERAC.AntiFreeCam then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local camCoords = GetFinalRenderedCamCoord()
                local distance = #(playerCoords - camCoords)
                if distance > 50 then
                    EMBERAC_ACTION(EMBERAC.CamPunishment, "Anti Free Cam",
                        "Used freecam hacks")
                end
            end
            if EMBERAC.AntiMenyoo then
                if IsPlayerCamControlDisabled() ~= false then
                    EMBERAC_ACTION(EMBERAC.MenyooPunishment, "Anti Menyoo",
                        "Used menyoo camera hack")
                end
            end
            if EMBERAC.AntiAimAssist then
                local aimassiststatus = GetLocalPlayerAimState()
                if aimassiststatus ~= 3 then
                    EMBERAC_ACTION(EMBERAC.AimAssistPunishment, "Anti Aim Assist",
                        "Used aim assist : **" .. aimassiststatus .. "**")
                end
            end
            if EMBERAC.AntiWeaponDamageChanger then
                local weapon = GetSelectedPedWeapon(PlayerPedId())
                local weaponDamage = math.floor(GetWeaponDamage(weapon))
                local weaponData = DAMAGE[weapon]
                if weaponData and weaponDamage > weaponData.DAMAGE then
                    local weaponName = weaponData.name
                    local normalDamage = weaponData.DAMAGE
                    local message = string.format("Tried to change %s damage to %d (Normal damage is: %d)", weaponName,
                        weaponDamage, normalDamage)
                    EMBERAC_ACTION(EMBERAC.WeaponPunishment, "Anti Weapon Damage Changer",
                        message)
                end
            end
            if EMBERAC.AntiWeaponsExplosive then
                local weapon = GetSelectedPedWeapon(PlayerPedId())
                local damageType = GetWeaponDamageType(weapon)
                N_0x4757f00bc6323cfe(GetHashKey("WEAPON_EXPLOSION"), 0.0)

                local explosiveDamageTypes = { 4, 5, 6, 13 }
                local isExplosive = false
                for _, damage in ipairs(explosiveDamageTypes) do
                    if damage == damageType then
                        isExplosive = true
                        break
                    end
                end

                if isExplosive then
                    local weaponName = GetWeapontypeModel(weapon)
                    local message = string.format("Tried to use %s (explosive) weapon", weaponName)
                    EMBERAC_ACTION(EMBERAC.WeaponPunishment, "Anti Weapon Explosive", message)
                end
            end
            if EMBERAC.AntiPedChanger then
                local playerPedModel = GetEntityModel(PlayerPedId())
                local isWhitelisted = false
                for _, whitelistedModel in ipairs(WhiteListPeds) do
                    if playerPedModel == GetHashKey(whitelistedModel) then
                        isWhitelisted = true
                        break
                    end
                end
                if not isWhitelisted then
                    local message = string.format("Tried to change ped to %s", tostring(playerPedModel))
                    EMBERAC_ACTION(EMBERAC.PedChangePunishment, "Anti Ped Changer", message)
                end
            end
            if EMBERAC.AntiBlacklistTasks then
                local playerPed = PlayerPedId()
                for _, taskName in ipairs(Tasks) do
                    if GetIsTaskActive(playerPed, taskName) then
                        local message = string.format("Tried to play blacklisted task: %s", taskName)
                        EMBERAC_ACTION(EMBERAC.TasksPunishment, "Anti Black List Tasks",
                            message)
                    end
                end
            end
            if EMBERAC.AntiBlacklistAnims then
                local playerPed = PlayerPedId()

                for _, anim in ipairs(Anims) do
                    local dict, animName = anim.dict, anim.anim
                    if IsEntityPlayingAnim(playerPed, dict, animName, 3) then
                        local message = string.format("Tried to play blacklisted animation %s and %s", dict, animName)
                        EMBERAC_ACTION(EMBERAC.AnimsPunishment, "Anti Black List Animation",
                            message)
                        ClearPedTasks(playerPed)
                    end
                end

                Wait(100)
            end
            if EMBERAC.AntiTinyPed then
                local Tiny = GetPedConfigFlag(PlayerPedId(), 223, true)
                if Tiny then
                    EMBERAC_ACTION(EMBERAC.PedFlagPunishment, "Anti Tiny Ped",
                        "Tried to turn into tiny ped")
                end
                Wait(100)
            end
            Wait(2000)
        end
    end
end)

--【 𝗖𝗵𝗲𝗰𝗸 𝗧𝗵𝗲𝗮𝗿𝗱 2 】--
Citizen.CreateThread(function()
    local waitTime = 3000

    while SPAWN do
        Wait(waitTime)

        if EMBERAC.SafePlayers then
            SetEntityProofs(PlayerPedId(), false, true, true, false, false, false, false, false)
        end

        if EMBERAC.AntiInfinityAmmo then
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end

        if EMBERAC.AntiChangeSpeed then
            local ped = PlayerPedId()

            if not IsPedInAnyVehicle(ped, false) then
                local speed = GetEntitySpeed(ped)

                if IsPedRunning(ped) and speed > 9 and not IsPedJumping(ped) then
                    local message = string.format("Tried to change the walk speed: **%.2f**", speed)
                    EMBERAC_ACTION(EMBERAC.SpeedPunishment, "Anti Fast Run", message)
                end
            else
                local vehicle = GetVehiclePedIsIn(ped, false)

                if DoesEntityExist(vehicle) then
                    local maxSpeed = GetVehicleEstimatedMaxSpeed(vehicle)
                    local speed    = GetEntitySpeed(vehicle)
                    local total    = maxSpeed + 10

                    if speed > total then
                        local message = string.format("Tried to change the vehicle speed: **%.2f KM**", speed * 3.6)
                        EMBERAC_ACTION(EMBERAC.SpeedPunishment, "Anti Speed Changer", message)
                    end
                end
            end
        end

        if EMBERAC.AntiTeleport then
            while IsPlayerSwitchInProgress() do
                Wait(5000)
            end

            local coords = GetEntityCoords(PlayerPedId())

            if IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedFalling(PlayerPedId()) then
                Wait(1000)

                local newCoords = GetEntityCoords(PlayerPedId())
                local distance  = Vdist(coords, newCoords)

                if distance >= EMBERAC.MaxVehicleDistance then
                    EMBERAC_ACTION(EMBERAC.TeleportPunishment, "Anti Teleport",
                        "Tried teleporting in a vehicle")
                end
            end
        end

        Wait(0)
    end
end)

--【 𝗦𝘁𝗼𝗽 𝗥𝗲𝘀𝗼𝘂𝗿𝗰𝗲 】--
RegisterNetEvent('EMBERAC:checkStatus')
AddEventHandler('EMBERAC:checkStatus', function(data)
    TriggerServerEvent('EMBERAC:passScriptInfo', data.name, data.path)
end)

--【 𝗦𝘁𝗮𝗿𝘁 𝗥𝗲𝘀𝗼𝘂𝗿𝗰𝗲 】--
AddEventHandler('onClientResourceStart', function(resourceName)
    if EMBERAC.AntiResourceStarter or EMBERAC.AntiResourceRestarter then
        Citizen.CreateThread(function()
            while true do
                Wait(1000)
                if IsPedWalking(PlayerPedId()) or GetCamActiveViewModeContext() then
                    local message = string.format("Tried to start resource: **%s**!", resourceName)
                    TriggerServerEvent("EMBERAC:BanFromClient", EMBERAC.ResourcePunishment, "Anti Resource Starter",
                        message)
                    break
                end
            end
        end)
    end

    if resourceName == GetCurrentResourceName() then
        TriggerServerEvent('EMBERAC:CheckIsAdmin')
    end
end)

--【 𝗔𝗻𝘁𝗶 𝗦𝘂𝗶𝗰𝗶𝗱𝗲 】--
AddEventHandler("gameEventTriggered", function(name, args)
    if EMBERAC.AntiSuicide and name == "CEventNetworkEntityDamage" then
        local playerPed = PlayerPedId()
        local attacker  = NetworkGetEntityOwner(args[1])
        local weapon    = args[7]
        local isFall    = weapon == GetHashKey('WEAPON_FALL')

        if args[1] == playerPed and args[2] == -1 and #args == 14 and
            args[3] == 0 and args[4] == 0 and args[5] == 0 and args[6] == 1 and
            isFall and args[8] == 0 and args[9] == 0 and
            args[10] == 0 and args[11] == 0 and args[12] == 0 and args[13] == 0 then
            EMBERAC_ACTION(EMBERAC.SuicidePunishment, "Anti Suicide", "Tried to suicide")
        end
    end

    if EMBERAC.AntiPickupCollect and name == 'CEventNetworkPlayerCollectedPickup' then
        local message = string.format("Tried to collect a pickup: **%s**", json.encode(args))
        EMBERAC_ACTION(EMBERAC.PickupPunishment, "Anti Collected Pickup", message)
    end
end)

--【 𝗘𝘅𝗽𝗼𝗿𝘁𝘀 】--
function EMBERAC_ACTION(punishment, reason, details)
    if EMBERAC_CHECK_TEMP_WHITELIST() == false then
        TriggerServerEvent('EMBERAC:BanFromClient', punishment, reason, details)
    end
end

function EMBERAC_CHANGE_TEMP_WHHITELIST(STATUS)
    if STATUS == true then
        WHITELIST = STATUS
    elseif STATUS == false then
        WHITELIST = STATUS
    end
end

function EMBERAC_CHECK_TEMP_WHITELIST()
    return WHITELIST
end
