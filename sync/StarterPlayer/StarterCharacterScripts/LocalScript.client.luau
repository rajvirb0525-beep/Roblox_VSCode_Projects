--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local RigModule = require(ReplicatedStorage:WaitForChild("RigModule"))
local character = script.Parent
local BodyParts = RigModule.GetR6BodyParts(character :: any)
local Raycast_cooldown : number = 0.05
local accumulated_time : number = 0
local RaycastParams : RaycastParams = RaycastParams.new()
RaycastParams.FilterDescendantsInstances = {character}
RaycastParams.FilterType = Enum.RaycastFilterType.Exclude

RunService.Heartbeat:Connect(function(dt : number)   
    accumulated_time += dt

    if accumulated_time >= Raycast_cooldown then
        if BodyParts.Humanoid.MoveDirection.Magnitude > 0.1 then
            local RaycastOriginOffset = BodyParts.HumanoidRootPart.CFrame.LookVector * 2
            local RaycastOrigin = BodyParts.HumanoidRootPart.Position + RaycastOriginOffset
            local RaycastDirection = Vector3.new(0, -5, 0)

            local result = workspace:Raycast(RaycastOrigin, RaycastDirection, RaycastParams)

            if result and result.Instance.Name == "LedgePart" then
                BodyParts.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 100, 0)
            end
            print("Congratulations!")
        else
            print("Nice Try!")
		end
	accumulated_time = 0
    end
end)