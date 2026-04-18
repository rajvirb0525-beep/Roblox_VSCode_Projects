--!strict
local StateManager = {}

StateManager.__index = StateManager

export type playerState = "Idle" | "Move" | "Attack" | "GrabItem" | "GrabLedge" | "Stunned" | "Freefall"

local playerStates : {[playerState] : boolean} = {
    Idle = true,
    Move = true,
    Attack = true,
    GrabItem = true,
    GrabLedge = true,
    Stunned = true,
    Freefall = true
}

export type StateObject = {
    CurrentState: playerState,
    SetState: (self: StateObject, newState: playerState) -> (),
    GetState: (self: StateObject) -> playerState
}

function StateManager.new(initialState : playerState?) : StateObject
    local self = setmetatable({}, StateManager)

    self.CurrentState = initialState

    return (self :: any) :: StateObject
end 

function StateManager:SetState(newState : playerState)
    if not playerStates[newState] then return end
    self.CurrentState = newState
end

function StateManager:GetState() : playerState
    return self.CurrentState :: playerState
end

return StateManager