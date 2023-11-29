-- EmberAC (https://github.com/Julien86580/Emberac-AntiCheat-Fivem)
-- Copyright 2023-2028 by Julien&Julie Vendeta(Masturlute) (https://github.com/Julien86580/)
-- Licensed under the GNU Affero General Public License v3.0

fx_version 'cerulean'
game 'gta5'

author 'Julie Vendeta'
description 'EmberAC'
version '6.2.3'

shared_scripts {
    'tables/*.lua',
    'whitelists/*.lua',
    'configs/*.lua'
}

client_script 'src/EMBERA-client.lua'

server_scripts {
    'src/EMBERA-server.lua',
    'src/EMBERA-discord-report.lua', -- Ajoutez cette ligne pour inclure le script Discord de rapport
}

client_scripts {
    '@menuv/menuv.lua',
    'src/EMBERA-menu.lua',
}

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

dependencies {
    'menuv',
}
