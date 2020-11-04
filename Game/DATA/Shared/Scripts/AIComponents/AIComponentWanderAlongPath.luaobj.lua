local L0, L1, L2
L0 = {}
L0.TimerCallbackName = "TimerWander"
WanderAlongPath = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = WanderAlongPath
L0(L1, L2)
L0 = RegisterForEvent
L1 = "ComponentStart"
L2 = WanderAlongPath
L0(L1, L2)
L0 = RegisterForEvent
L1 = "WanderPause"
L2 = WanderAlongPath
L0(L1, L2)
L0 = RegisterForEvent
L1 = "WanderResume"
L2 = WanderAlongPath
L0(L1, L2)
L0 = RegisterForEvent
L1 = "ComponentHalt"
L2 = WanderAlongPath
L0(L1, L2)
L0 = WanderAlongPath
function L1(A0)
  local L1, L2, L3, L4
  L1 = InitTimer
  L2 = A0.TimerCallbackName
  L3 = 0.25
  L4 = true
  L1(L2, L3, L4)
  L1 = WanderAlongPath
  L2 = L1
  L1 = L1.ComponentStart
  L1(L2)
end
L0.ComponentInit = L1
L0 = WanderAlongPath
function L1(A0)
  local L1, L2
  L1 = ResetAndStartTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.ComponentStart = L1
L0 = WanderAlongPath
function L1(A0)
  local L1, L2
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.WanderPause = L1
L0 = WanderAlongPath
function L1(A0)
  local L1, L2
  L1 = ResetAndStartTimer
  L2 = A0.TimerCallbackName
  L1(L2)
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_MOVING
  L1(L2)
end
L0.WanderResume = L1
L0 = WanderAlongPath
function L1(A0)
  local L1, L2
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.ComponentHalt = L1
function L0()
  local L0, L1, L2, L3
  L0 = GetState
  L0 = L0()
  L1 = AI_HALTED
  if L0 == L1 then
    return
  end
  L1 = SetStateAndMove
  L2 = AI_MOVE
  L3 = GetWaypoint
  L3 = L3()
  L1(L2, L3)
  L1 = GetDist
  L2 = GetMyPos
  L2 = L2()
  L3 = GetWaypoint
  L3 = L3()
  L1 = L1(L2, L3)
  if L1 < 300 then
    L1 = IncrementWaypoint
    L1()
  end
end
TimerWander = L0
