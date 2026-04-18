--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local StateManager = require(ReplicatedStorage.Modules.StateManager)
local RigModule = require(ReplicatedStorage.Modules:WaitForChild("RigModule"))
local LedgeModule = require(ReplicatedStorage.Modules:WaitForChild("LedgeModule"))

local character = script.Parent
local BodyParts = RigModule.GetR6BodyParts(character :: any)
local HumanoidRootPart = BodyParts.HumanoidRootPart

local Raycast_cooldown : number = 0.05
local accumulated_time : number = 0

local RaycastParams : RaycastParams = RaycastParams.new()
RaycastParams.FilterDescendantsInstances = {character}
RaycastParams.FilterType = Enum.RaycastFilterType.Exclude

local PlayerState = StateManager.new("Idle")
RunService.Heartbeat:Connect(function(dt : number)  
	accumulated_time += dt
	if accumulated_time < Raycast_cooldown then return end
	accumulated_time = 0
	if BodyParts.Humanoid.MoveDirection.Magnitude > 0.1 then 
		PlayerState:SetState("Move")
	else
		PlayerState:SetState("Idle")
		return
	end
	local LedgeResult = LedgeModule.LedgeShapecastHitbox(HumanoidRootPart, RaycastParams)
	if LedgeResult and LedgeResult.Instance then print(LedgeResult.Normal) end
end)