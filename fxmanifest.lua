fx_version 'adamant'
game 'gta5'
version '0.0.1'
author 'POLARIS'
description 'Simple Job Center for QBCore'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua',
}

shared_script {
    '@PolyZone/CircleZone.lua',
    'config.lua'
}

lua54 'yes'
