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
local datastore2 = require(1936396537)


local function savefunction(plr)

	local tab = {}

	for i,v in pairs(datatable:GetChildren()) do
		if plr:findFirstChild(v.Name) then
			local faketable = {}
			for e,a in pairs(plr[v.Name]:GetChildren()) do
				faketable[a.Name]= a.Value
			end
			tab[v.Name] = faketable
		end
	end
	return tab
end

local function plradded(plr)
	local data = datastore2("TestDataStorexD",plr)
	for i,v in pairs(datatable:GetChildren()) do
		local clone = v:Clone()
		clone.Parent = plr
	end

	local plrdata
	local succ,err = pcall(function()
		plrdata= data:Get()
	end)
	if succ then
		if plrdata then
			for i,v in pairs(data:Get()) do
				if plr:findFirstChild(i) then
					if v then
						for e,a in pairs(v) do
							if plr[i]:findFirstChild(e) then
								plr[i][e].Value = a
							end
						end
					end
				end
			end
		end


		for i,v in pairs(datatable:GetChildren()) do
			if plr:findFirstChild(v.Name) then
				for e,a in pairs(plr[v.Name]:GetChildren()) do
					a.Changed:Connect(function()
						data:Set(savefunction(plr))
					end)
				end
			end
		end


		while true do wait(60)
			data:Set(savefunction(plr))
		end
	end
end

game.Players.PlayerAdded:Connect(plradded)
for i,v in pairs(game.Players:GetPlayers()) do
	spawn(function()
		plradded(v)
	end)
end
