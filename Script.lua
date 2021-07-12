local ChangeHistoryService = game:GetService("ChangeHistoryService")

-- Create a new toolbar section titled "Custom Script Tools"
local toolbar = plugin:CreateToolbar("ElectricalSpy's DataStore2 Script")

-- Add a toolbar button named "Create Empty Script"
local newScriptButton = toolbar:CreateButton("DataStore2 Creator", "Setup DataStore2", "rbxassetid://4458901886")
-- Make button clickable even if 3D viewport is hidden
newScriptButton.ClickableWhenViewportHidden = true

local function onNewScriptButtonClicked()
	script.DataStore:Clone().Parent = game.ServerStorage
	local datastorescript = script.DatastoreScript:Clone() datastorescript.Disabled=false datastorescript.Parent = game.ServerScriptService
	script.SaveInStudio:Clone().Parent = game.ServerStorage
end
newScriptButton.Click:Connect(onNewScriptButtonClicked)

