--!strict

local character = script.Parent
local CharacterModule = require(game:GetService("ReplicatedStorage"):WaitForChild("RigModule"))
local BodyParts : CharacterModule.R6BodyParts = CharacterModule.GetR6BodyParts(character :: any)
local PlayerAppearanceEvent = game:GetService("ReplicatedStorage").RemoteEvents:WaitForChild("PlayerAppearanceEvent")
PlayerAppearanceEvent:FireServer(BodyParts)



--local Afterimage_Effect_Cooldown = 0.08
--local currentEffectCooldown = Afterimage_Effect_Cooldown

--game:GetService("RunService").RenderStepped:Connect(function(dt : number)
--	if BodyParts.Humanoid.MoveDirection.Magnitude <= 0.1 then return end
	
--	currentEffectCooldown -= dt
	
--	if currentEffectCooldown <= 0 then
--		for _, Part in pairs(BodyParts :: any) do
--			local BodyPart = Part :: BasePart
--			if BodyPart:IsA("BasePart") then
--				local clone = BodyPart:Clone()
--				clone:ClearAllChildren()
--				clone.Parent = workspace.ClonedObjects
--				clone.CanCollide = false
--				clone.Anchored = true
--				clone.Material = Enum.Material.Neon
--				clone.Transparency = 0.5
				
--				game:GetService("Debris"):AddItem(clone, 1)
--			end
			
--		end
--	currentEffectCooldown = Afterimage_Effect_Cooldown
--	end
--end)

