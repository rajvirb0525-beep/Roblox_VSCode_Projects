--!strict

local LedgeModule = {}

function LedgeModule.FormAboveLedgeRay(origin : Vector3, direction : Vector3, Params : RaycastParams?, VisualPosition : Vector3)
	local RayPart : Part = Instance.new("Part")
	RayPart.Position = direction
	local AboveRayResult = workspace:Shapecast(RayPart, direction, Params)
	RayPart.Parent = game.Workspace
	RayPart.Anchored = true
	RayPart.CanCollide = false
	RayPart.Transparency = 0
	RayPart.Color = Color3.fromRGB(255, 0, 0)
	game:GetService("Debris"):AddItem(RayPart, 0.5)
	
	return AboveRayResult
end

function LedgeModule.FormBelowLedgeRay(origin : Vector3, direction : Vector3, Params : RaycastParams?, VisualPosition : Vector3)
	local RayPart : Part = Instance.new("Part")
	RayPart.Position = direction
	local BelowRayResult = workspace:Shapecast(RayPart, direction, Params)
	RayPart.Parent = game.Workspace
	RayPart.Anchored = true
	RayPart.CanCollide = false
	RayPart.Transparency = 0
	RayPart.Color = Color3.fromRGB(0, 255, 0)
	game:GetService("Debris"):AddItem(RayPart, 0.5)
	
	return BelowRayResult
end


return LedgeModule
