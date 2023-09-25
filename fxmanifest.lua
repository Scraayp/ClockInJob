fx_version "cerulean"
game "gta5"

author "Scraayp"
description "A resource to make clocking in and out easier for the police/other jobs."
version "1.0.0"

resource_type "gametype" { name = "KlokIn" }

shared_script "config.lua"
client_script "mymode_client.lua"
server_script "server_scripts.lua"
