fx_version 'cerulean'
game 'gta5'

author 'Flawws, Flakey, Idris and the Project Sloth team'
description 'EchoRP MDT Rewrite for QBCore'
version '2.6.0'

lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/vehicles.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/config.lua',
    'server/utils.lua',
    'server/dbm.lua',
    'server/main.lua'
}

client_scripts{
    'client/main.lua',
    'client/cl_impound.lua',
    'client/cl_mugshot.lua'
} 

ui_page 'ui/dashboard.html'

files {
    'ui/img/*.png',
    'ui/img/*.webp',
    'ui/dashboard.html',
    'ui/app.js',
    'ui/style.css',
}
