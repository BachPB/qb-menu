fx_version 'cerulean'
game 'gta5'
author 'Bach'
description 'QB-Menu Edit By BachWorks (& OX CONVERT)'
version 'NW'

client_scripts{
 'client/*.lua',
}
shared_scripts {
 '@ox_lib/init.lua', -- Comment if not needed
 'config.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
}

lua54 'yes'
