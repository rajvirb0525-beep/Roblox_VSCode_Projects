--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AppearanceEvent = ReplicatedStorage.RemoteEvents:WaitForChild("PlayerAppearanceEvent")
local RigModule = require(ReplicatedStorage:WaitForChild("RigModule"))
print("?")
AppearanceEvent.OnServerEvent:Connect(function(Player : Player, BodyParts)
	print(BodyParts.Humanoid)
	RigModule.ApplyPlayerAppearance(Player, BodyParts.Humanoid :: Humanoid)
end)