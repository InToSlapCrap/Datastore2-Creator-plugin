local Knit = require(game:GetService("ReplicatedStorage").Knit)


local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("IntermissionGui")

local TimerController = Knit.CreateController  {
	Name = "TimerService";
	Client = {}
}

function TimerController:KnitInit()
	print("Controller Initialized")
end

function TimerController:KnitStart()
	print("Controller Started")
	while true do wait(.5)
		local service = Knit.GetService("TimerService")
		local status = service:GetStatus()
		gui.IntermissionTimer.Text = status
	end
end	

return TimerController
