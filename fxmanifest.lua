-------------------------------------
--<!>-- Shadow | Pegasus --<!>--
--------------------------------------
fx_version 'cerulean'
game 'gta5'
name 'AY-Yoga'
author 'AY-Framework'
description 'Immersive Yoga Activity with Animations and Benefits for QBCore'
version '4.4.4.4'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}
