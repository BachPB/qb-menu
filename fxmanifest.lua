fx_version     'cerulean'
game           'gta5'
author         'Bach'
lua54          'yes'
ui_page        'html/index.html'
description    'QB-Menu Edit By BachWorks (& OX CONVERT)'

client_scripts {
 'client/*.lua',
}

shared_scripts {
 '@ox_lib/init.lua', -- Comment if not needed
 'config.lua',
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
}
