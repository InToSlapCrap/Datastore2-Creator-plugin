--[[
.______       _______     ___       _______     .___  ___.  _______ 
|   _  \     |   ____|   /   \     |       \    |   \/   | |   ____|
|  |_)  |    |  |__     /  ^  \    |  .--.  |   |  \  /  | |  |__   
|      /     |   __|   /  /_\  \   |  |  |  |   |  |\/|  | |   __|  
|  |\  \----.|  |____ /  _____  \  |  '--'  |   |  |  |  | |  |____ 
| _| `._____||_______/__/     \__\ |_______/    |__|  |__| |_______|
                                                                    

datatable = the folder with the folders ++ data example
ServerStorage>Datastore>leaderstats>intvalue

Set standard values by giving the itnvalue or whatever value a value.

 __       __    ______  _______ .__   __.      _______. _______  _______          _______..______   ____    ____ 
|  |     |  |  /      ||   ____||  \ |  |     /       ||   ____||       \        /       ||   _  \  \   \  /   / 
|  |     |  | |  ,----'|  |__   |   \|  |    |   (----`|  |__   |  .--.  |      |   (----`|  |_)  |  \   \/   /  
|  |     |  | |  |     |   __|  |  . `  |     \   \    |   __|  |  |  |  |       \   \    |   ___/    \_    _/   
|  `----.|  | |  `----.|  |____ |  |\   | .----)   |   |  |____ |  '--'  |   .----)   |   |  |          |  |     
|_______||__|  \______||_______||__| \__| |_______/    |_______||_______/    |_______/    | _|          |__|     

Devforum: https://devforum.roblox.com/u/eletricalspy
Portfolio: https://devforum.roblox.com/t/766093

]]--

-- // Settings

local datatable = game.ServerStorage.DataStore

-- // Don't edit below if u don't know what ur doing
local datastore2 = require(script.DataStore2)

datastore2.Combine("MainKey")

local function savefunction(plr,v)

	local tab = {}

	if v then
		for e,a in pairs(v:GetChildren()) do
			tab[a.Name]= a.Value
		end
	end
	return tab
end



datastore2.Combine("MasterKey")
local function plradded(plr)
	for i,v in pairs(datatable:GetChildren()) do
		local folder = v:Clone() folder.Parent = plr
		local data = datastore2(v.Name,plr)

		local save
		local succ,err = pcall(function()
			save=data:Get()
		end)

		if succ then

			-- Loads Save
			if save then
				for e,a in pairs(folder:GetChildren()) do
					if save[a.Name] then
						a.Value = save[a.Name]
					end
				end
			end

			-- Save Data when Updates
			for _,plrdata in pairs(folder:GetChildren()) do
				plrdata.Changed:connect(function()
					data:Set(savefunction(plr,folder))
				end)
			end

		end

		if not succ then
			print(err)
		end
	end
	
end

game.Players.PlayerAdded:Connect(plradded)
for i,v in pairs(game.Players:GetPlayers()) do
	spawn(function()
		plradded(v)
	end)
end
