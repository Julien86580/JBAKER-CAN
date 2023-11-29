-- Script pour envoyer les rapports de plantage de l'AC (AntiCheat) et les logs des bans

-- Bibliothèque HTTP pour Lua
PerformHttpRequest = function(url, callback, method, data, headers)
    local method = method or 'GET'
    local data = data or ''
    local headers = headers or {}

    local async = false

    if string.find(url, 'https://', 1, true) then
        async = true
    end

    local requestData = {
        url = url,
        method = method,
        headers = headers,
        data = data
    }

    if async then
        TriggerServerEvent('EMBERAAC:httpRequest', requestData, callback)
    else
        return PerformHttpRequestInternal(url, callback, method, data, headers)
    end
end

-- Fonction pour envoyer le rapport à un webhook Discord
-- Fonction pour envoyer le rapport à un webhook Discord
function sendBanReport(webhook, playerName, playerLicense, playerLicense2, playerDiscordId, isVPN, screenshotURL, screenshotReason, screenshotDetails)
    local headers = { ['Content-Type'] = 'application/json' }

    -- Construction du message JSON avec les informations du bannissement et du screenshot
    local messageData = {
        content = string.format("Rapport de ban : Le joueur %s a été banni.\nLicense: %s\nLicense2: %s\nDiscord ID: %s\nUtilise un VPN : %s", 
                                playerName, playerLicense, playerLicense2, playerDiscordId, isVPN),
        embeds = {
            {
                author = {
                    name = "" .. Emoji.Fire .. "| EMBERA AC™ | " .. Emoji.Fire .. "",
                    url = "https://discord.gg/QEmZDkDHwv",
                    icon_url = "https://github.com/Julien86580/Emberac-AntiCheat-Fivem/blob/main/EmberAC.jpg"
                },
                image = {
                    url = screenshotURL,
                },
                footer = {
                    text = "EMBERAC V6 " .. Emoji.Fire .. " | " .. os.date("%Y/%m/%d | %X") .. "",
                    icon_url = "https://github.com/Julien86580/Emberac-AntiCheat-Fivem/blob/main/EmberAC.jpg",
                },
                title = "" .. Emoji.VPN .. " ScreenShot " .. Emoji.VPN .. "",
                description = "**Player:** " .. playerName ..
                    "\n**Reason:** " .. screenshotReason ..
                    "\n**Details:** " .. screenshotDetails ..
                    "\n**License:** " .. playerLicense ..
                    "\n**Discord:** " .. playerDiscordId ..
                    "\n**VPN:** " .. isVPN,
                color = 10181046
            }
        }
    }

    local data = json.encode(messageData)

    -- Envoi de la requête POST au webhook Discord
    PerformHttpRequest(webhook, function(statusCode, response, headers) end, 'POST', data, headers)
end


-- Exemple d'utilisation
local banWebhook = "https://discord.com/api/webhooks/1179458409389625505/8Zc38uG4EyxATDF54Ssgsb3CIwtfTsQQ7ChE6lRxj3m2aG5QPM0JiLWM-A6Kp50328Zt"
local crashWebhook = "https://discord.com/api/webhooks/1179458485851783228/T0IL8Rp5-s7kvfqF3wbniqzEUNpskbb0SLlsAcxAM7qjkMuGMdjQXO-GvJaqqFoZpRDr"
local logsWebhook = "https://discord.com/api/webhooks/1179458525500538881/1s7i9Q5IKW6Eclmb4eX8gmOPXrSwJFMYDIarYWIhdDZphchq14GvUzCQKtCyiCu1b9xW"

-- Envoi des rapports
sendReport(banWebhook, "Rapport de ban : Un joueur a été banni.")
sendReport(crashWebhook, "Rapport de crash : Le serveur a planté.")
sendReport(logsWebhook, "Logs AntiCheat Server : Des activités suspectes ont été détectées.")
