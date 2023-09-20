--================================--
--              CHAT              --
--================================--

function sendMessage(source, text, name)
	TriggerClientEvent("chat:addMessage", source, {
		templateId = "policeClockBot",
		args = {
			name or "Job",
			text,
		},
	})
end
