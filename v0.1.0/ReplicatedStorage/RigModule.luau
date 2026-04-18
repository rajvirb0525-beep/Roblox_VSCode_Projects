--!strict
local RigModule = {}
local Types = require(script.Parent:WaitForChild("PredefinedTypes"))
-- // I did this because then I will never 
-- have to repeat these across projects //

-- // I return the R6 BodyParts this way because my character has
-- specific names for parts, and this creates a predictable pattern
-- of retrieving an R6 rig's parts through a local variable assigned to
-- the BodyParts table //


export type R6BodyParts = Types.R6Rig

function RigModule.GetR6BodyParts(character) : R6BodyParts
	local BodyParts = {
	Humanoid = character:WaitForChild("Humanoid") :: Humanoid,
	Head = character:WaitForChild("Head") :: BasePart,
	HumanoidRootPart = character:WaitForChild("HumanoidRootPart") :: BasePart,
	Left_Arm = character:WaitForChild("Left Arm") :: BasePart,
	Left_Leg = character:WaitForChild("Left Leg") :: BasePart,
	Right_Arm = character:WaitForChild("Right Arm") :: BasePart,
	Right_Leg = character:WaitForChild("Right Leg") :: BasePart,
	Torso = character:WaitForChild("Torso") :: BasePart
	}
	return BodyParts :: R6BodyParts
end

function RigModule.ApplyPlayerAppearance(player : Player, humanoid : Humanoid)
	local success : boolean, result = pcall(function()
		local userId = player.UserId
		return game:GetService("Players"):GetHumanoidDescriptionFromUserIdAsync(userId)
	end)
	
	if success then
		humanoid:ApplyDescriptionAsync(result)
	end
end

return RigModule
