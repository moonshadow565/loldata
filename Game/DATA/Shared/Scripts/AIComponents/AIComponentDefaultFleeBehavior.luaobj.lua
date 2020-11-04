local L0, L1, L2
L0 = 2
RUN_IN_FEAR = L0
L0 = 1
HOSTILE = L0
L0 = 0
INACTIVE = L0
L0 = {}
L0.TimerCallbackName = "TimerFlee"
DefaultFleeBehavior = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = DefaultFleeBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "OnFleeBegin"
L2 = DefaultFleeBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "OnFleeEnd"
L2 = DefaultFleeBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "ComponentHalt"
L2 = DefaultFleeBehavior
L0(L1, L2)
L0 = DefaultFleeBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = InitTimer
  L2 = A0.TimerCallbackName
  L3 = 0.5
  L4 = true
  L1(L2, L3, L4)
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.ComponentInit = L1
L0 = DefaultFleeBehavior
function L1(A0)
  local L1, L2
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.ComponentHalt = L1
L0 = DefaultFleeBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = MakeFleePoint
  L2 = L2()
  fleePoint = L2
  L2 = SetStateAndMove
  L3 = AI_FLEEING
  L4 = fleePoint
  L2(L3, L4)
  L2 = SetRoamState
  L3 = RUN_IN_FEAR
  L2(L3)
  L2 = TurnOffAutoAttack
  L3 = STOPREASON_IMMEDIATELY
  L2(L3)
  L2 = ResetAndStartTimer
  L3 = A0.TimerCallbackName
  L2(L3)
end
L0.OnFleeBegin = L1
L0 = DefaultFleeBehavior
function L1(A0)
  local L1, L2, L3
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = StopTimer
  L3 = A0.TimerCallbackName
  L2(L3)
  L2 = SetRoamState
  L3 = HOSTILE
  L2(L3)
  L2 = NetSetState
  L3 = AI_ATTACK
  L2(L3)
  L2 = TimerRetreat
  if L2 ~= nil then
    L2 = TimerRetreat
    L2()
  end
  L2 = TimerAttack
  if L2 ~= nil then
    L2 = TimerAttack
    L2()
  end
end
L0.OnFleeEnd = L1
function L0()
  local L0, L1, L2, L3
  L0 = GetState
  L0 = L0()
  L1 = AI_HALTED
  if L0 == L1 then
    return
  end
  L1 = MakeFleePoint
  L1 = L1()
  fleePoint = L1
  L1 = SetRoamState
  L2 = RUN_IN_FEAR
  L1(L2)
  L1 = SetStateAndMove
  L2 = AI_FLEEING
  L3 = fleePoint
  L1(L2, L3)
end
TimerFlee = L0
L0 = DefaultFleeBehavior
return L0
