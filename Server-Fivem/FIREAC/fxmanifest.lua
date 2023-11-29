--
-- EmberAC (https://github.com/Julien86580/Emberac-AntiCheat-Fivem)
-- Copyright 2023-2028 by Julien&Julie Vendeta(Masturlute) (https://github.com/Julien86580/)
-- Licensed under the GNU Affero General Public License v3.0
--

-- 【 𝗥𝗲𝘀𝗼𝘂𝗿𝗰𝗲 métadonnées 】--
fx_version 'cerulean'
game 'gta5'

-- 【 𝗜𝗡𝗙𝗢 】--
author 'Julie Vendeta'
description 'EmberAC'
version '6.2.3'

-- 【 Partagée 】--
shared_scripts {
    -- 【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗲𝗮𝘁 】--
    'tables/*.lua',
    'whitelists/*.lua',
    'configs/*.lua'
}

-- 【 𝗖𝗹𝗶𝗲𝗻𝘁 】--
client_script 'src/EMBERA-client.lua'

-- 【 𝗦𝗲𝗿𝘃𝗲𝗿 】--
server_scripts {
    'src/EMBERA-server.lua',
}

-- 【 𝗔𝗱𝗺𝗶𝗻 𝗠𝗲𝗻𝘂 】--
client_scripts {
    '@menuv/menuv.lua',
    'src/EMBERA-menu.lua',
}

-- 【 𝗘𝘅𝗽𝗼𝗿𝘁 】--
exports {
    'EMBERAC_CHANGE_TEMP_WHHITELIST',
    'EMBERAC_CHECK_TEMP_WHITELIST',
    'EMBERAC_ACTION'
}

server_exports {
    'EMBERAC_CHANGE_TEMP_WHHITELIST',
    'EMBERAC_CHECK_TEMP_WHITELIST',
    'EMBERAC_ACTION'
}

-- 【 𝗗𝗲𝗽𝗲𝗻𝗱𝗲𝗻𝗰𝗶𝗲𝘀 】--
dependencies {
    'menuv',
}
