-------------------------------------
--<!>-- Shadow | Pegasus --<!>--
--------------------------------------
fx_version 'cerulean'
game 'gta5'
name 'AY-Yoga'
author 'AY-Framework'
description 'Advanced Yoga System with Multiple Locations for QBCore'
version '1.0.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}
