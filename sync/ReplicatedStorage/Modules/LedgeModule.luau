--!strict
--!native
--!optimize 2

local LedgeModule = {}

function LedgeModule.LedgeShapecastHitbox(HumanoidRootPart : BasePart, Params : RaycastParams)
    local SphereHitbox = Instance.new("Part") :: Part
    SphereHitbox.Shape = Enum.PartType.Ball
    SphereHitbox.Parent = game.Workspace
    SphereHitbox.Anchored = true
    SphereHitbox.CanCollide = false
    SphereHitbox.Transparency = 0.5
    SphereHitbox.Position = HumanoidRootPart.Position
    SphereHitbox.Size = Vector3.new(8, 8, 8)
    local LedgeShapecast = workspace:Shapecast(SphereHitbox, HumanoidRootPart.Position, Params)
    game:GetService("Debris"):AddItem(SphereHitbox, 0.5)
    return LedgeShapecast
end

return LedgeModule

--function LedgeModule.FormAboveLedgeRay(origin : Vector3, direction : Vector3, Params : RaycastParams?, VisualPosition : Vector3)
--	local RayPart : Part = Instance.new("Part")
--	RayPart.Position = direction
--	local AboveRayResult = workspace:Raycast(origin, direction, Params)
--	RayPart.Parent = game.Workspace
--	RayPart.Anchored = true
--	RayPart.CanCollide = false
--	RayPart.Transparency = 0
--	RayPart.Color = Color3.fromRGB(255, 0, 0)
--	game:GetService("Debris"):AddItem(RayPart, 0.5)

--	return AboveRayResult
--end

--function LedgeModule.FormBelowLedgeRay(origin : Vector3, direction : Vector3, Params : RaycastParams?, VisualPosition : Vector3)
--	local RayPart : Part = Instance.new("Part")
--	RayPart.Position = direction
--	local BelowRayResult = workspace:Raycast(origin, direction, Params)
--	RayPart.Parent = game.Workspace
--	RayPart.Anchored = true
--	RayPart.CanCollide = false
--	RayPart.Transparency = 0
--	RayPart.Color = Color3.fromRGB(0, 255, 0)
--	game:GetService("Debris"):AddItem(RayPart, 0.5)

--	return BelowRayResult
--end