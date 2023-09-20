--================================--
--           FUNCTIONS            --
--================================--

function ClockOutDiscordRegistration(id, name)
	local discord = GetPlayerIdentifier(playerPed)
	local job = "Politie"
	local playerDiscord = GetPlayerDiscord()
	if playerDiscord == false then
		playerDiscord = "Geen Discord kunnen vinden."
	end
	TriggerServerEvent("KlokUit:playerActivated", discord, name, job)
	return true
end

function ClockOut()
	local playerPed = PlayerPedId()
	local playerNaam = GetPlayerName(playerPed)
	local discordMessage = ClockInDiscordRegistration(playerPed, playerNaam)
	if discordMessage then
		sendMessage("Je bent uitgeklokt.", "Politie Klok")
	else
		sendMessage("Er is iets fout gegaan!", "Politie Klok")
	end
end

--================================--
--            COMMANDS            --
--================================--

RegisterCommand("DienstKlokUit", function(source, args, rawCommand)
	ClockOut()
end, false)
