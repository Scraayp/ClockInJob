fx_version("cerulean")
game("gta5")

name("inklok_politie")
description("A resource to make clocking in and out easier for the police/other jobs.")
author("Scraayp")
version("1.0.0")

shared_scripts({
	"config.lua",
})

client_scripts({
	"client/*.lua",
})

server_scripts({
	"server/*.lua",
})
