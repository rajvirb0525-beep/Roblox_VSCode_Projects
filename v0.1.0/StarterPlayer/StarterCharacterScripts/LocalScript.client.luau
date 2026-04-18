--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local RigModule = require(ReplicatedStorage.Modules:WaitForChild("RigModule"))
local LedgeModule = require(ReplicatedStorage.Modules:WaitForChild("LedgeModule"))

local character = script.Parent
local BodyParts = RigModule.GetR6BodyParts(character :: any)
local Head = BodyParts.Head
local HumanoidRootPart = BodyParts.HumanoidRootPart

local Raycast_cooldown : number = 0.05
local accumulated_time : number = 0

local RaycastParams : RaycastParams = RaycastParams.new()
RaycastParams.FilterDescendantsInstances = {character}
RaycastParams.FilterType = Enum.RaycastFilterType.Exclude

print(BodyParts, Raycast_cooldown)
RunService.Heartbeat:Connect(function(dt : number)  
	accumulated_time += dt
	if accumulated_time < Raycast_cooldown then return end
	accumulated_time = 0
	local aboveOrigin : Vector3 = Vector3.new(Head.Position.X, Head.Position.Y + 5, Head.Position.Z)
	local aboveDirection : Vector3 = aboveOrigin + (Head.CFrame.LookVector * 5)
	local aboveResult = LedgeModule.FormAboveLedgeRay(aboveOrigin, aboveDirection, RaycastParams, BodyParts.Head.Position)
	
	local belowOrigin : Vector3 = Vector3.new(HumanoidRootPart.Position.X + (HumanoidRootPart.CFrame.LookVector.X), HumanoidRootPart.Position.Y, HumanoidRootPart.Position.Z)
	local belowDirection : Vector3 = belowOrigin + Vector3.new(0, -5, 0)
	local belowResult = LedgeModule.FormBelowLedgeRay(belowOrigin, belowDirection, RaycastParams, HumanoidRootPart.Position)
	
	if belowResult and aboveResult then return end
	
	if belowResult and not aboveResult then 
		print("Roll Off")
		HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(100, 30, 0)
	elseif aboveResult and not belowResult then
		print("Grab")
		HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 100, 0)
	end
	
end)