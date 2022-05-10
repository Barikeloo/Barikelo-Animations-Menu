fx_version 'cerulean'

game 'gta5'

author 'Barikelo#1608'

--Client Scripts-- 
client_scripts {
    'NativeUI.lua',
	'Config.lua',
 	'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
	'Config.lua',
	'Server/*.lua'
}

export {
    'WalkMenuStart'
}
--UI Part-- 
ui_page {
 'Client/html/index.html', 
}

--File Part-- 
files {
 'Client/html/index.html',
 'Client/html/app.js', 
 'Client/html/main.css',
 'Client/html/ios.ttf',
 'Client/html/search.svg'
} 