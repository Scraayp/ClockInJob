function GetPlayerDiscord()
	local steamid = ''
	local license = ''
	local discord = ''
	local xbl = ''
	local liveid = ''
	local ip = ''

	for k, v in pairs(GetPlayerIdentifiers(source)) do
		print(v)

		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamid = v
		elseif string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xbl = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			ip = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		end
	end
	return discord
end

RegisterServerEvent("KlokIn:playerActivated")
AddEventHandler("KlokIn:playerActivated", function(discord, name, job)
	PerformHttpRequest(
		Config.discordWebHook,
		function(Error, Content, Head) end,
		"POST",
		json.encode({
			username = "[Job] Klok In",
			content = ("%n heeft zich ingeklokt\n\n<@%d> heeft zich ingeklot als %j"):format(name, discord, job),
		}),
		{ ["Content-Type"] = "application/json" }
	)
end)

RegisterServerEvent("KlokOut:playerActivated")
AddEventHandler("KlokOut:playerActivated", function(discord, name, job)
	PerformHttpRequest(
		Config.discordWebHook,
		function(Error, Content, Head) end,
		"POST",
		json.encode({
			username = "[Job] Klok Uit",
			content = ("%n heeft zich uitgeklokt\n\n<@%d> heeft zich uitgeklot als %j"):format(name, discord, job),
		}),
		{ ["Content-Type"] = "application/json" }
	)
end)
