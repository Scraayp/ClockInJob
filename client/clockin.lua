--================================--
--           FUNCTIONS            --
--================================--

function ClockInDiscordRegistration(id, name)
	local discord = GetPlayerIdentifier(playerPed)
	local job = "Politie"
	local playerDiscord = GetPlayerDiscord()
	if playerDiscord == false then
		playerDiscord = "Geen Discord kunnen vinden."
	end
	TriggerServerEvent("KlokIn:playerActivated", discord, name, job)
	return true
end

function ClockIn()
	local playerPed = PlayerPedId()
	local playerNaam = GetPlayerName(playerPed)
	local discordMessage = ClockInDiscordRegistration(playerPed, playerNaam)
	if discordMessage then
		sendMessage("Je bent ingeklokt.", "Politie Klok")
	else
		sendMessage("Er is iets fout gegaan!", "Politie Klok")
	end
end

--================================--
--            COMMANDS            --
--================================--

RegisterCommand("DienstKlokIn", function(source, args, rawCommand)
	ClockIn()
end, false)
