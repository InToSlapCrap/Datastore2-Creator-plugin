local Knit = require(game:GetService("ReplicatedStorage").Knit)

local intermission = 30
local gametime = 30
local players = game:GetService("Players")
local status = "Not Enough Players"

local TimerService = Knit.CreateService {
	Name = "TimerService";
	Client = {}
}



function TimerService.Client:GetStatus(player)
	return status
end




function TimerService:KnitInit()
	print("Timer Initted")
end


function TimerService:KnitStart()
	print("TimerService Started")
	while true do wait()
		if #players:GetPlayers() >1 then
			
			local ts = intermission
			repeat ts-=1 status = "Intermission: "..ts wait(1) until ts <= 1 or #game.Players:GetPlayers()<2
			
			if #game.Players:GetPlayers()>1 then
				for i,v in pairs(game.Players:GetPlayers()) do
					spawn(function()
						if v.Character then
							v.Character:MoveTo(workspace.Ingame.Position)
						end
					end)
				end
			end
			
			ts=gametime
			repeat ts-=1 status = "Ingame: "..ts wait(1) until ts <= 1 or #game.Players:GetPlayers()<2 or #workspace.Playing:GetChildren() <2
		else
			status = "Not Enough Players"
		end
	end
end

return TimerService
