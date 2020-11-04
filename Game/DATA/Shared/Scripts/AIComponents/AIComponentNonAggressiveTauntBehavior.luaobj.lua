local L0, L1, L2
L0 = {}
NonAggressiveTauntBehavior = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = NonAggressiveTauntBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "OnTauntBegin"
L2 = NonAggressiveTauntBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "OnTauntEnd"
L2 = NonAggressiveTauntBehavior
L0(L1, L2)
L0 = NonAggressiveTauntBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = InitTimer
  L2 = "TimerTaunt"
  L3 = 0.25
  L4 = true
  L1(L2, L3, L4)
  L1 = StopTimer
  L2 = "TimerTaunt"
  L1(L2)
end
L0.ComponentInit = L1
L0 = NonAggressiveTauntBehavior
function L1(A0)
  local L1, L2, L3
  L1 = TimerTaunt
  L1()
  L1 = ResetAndStartTimer
  L2 = "TimerTaunt"
  L1(L2)
  L1 = Event
  L2 = "WanderPause"
  L1(L2)
  L1 = Event
  L2 = "SkittishPause"
  L1(L2)
  L1 = SetStateAndMove
  L2 = AI_MOVE
  L3 = GetMyPos
  L3 = L3()
  L1(L2, L3)
end
L0.OnTauntBegin = L1
L0 = NonAggressiveTauntBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = StopTimer
  L3 = "TimerTaunt"
  L2(L3)
  L2 = Event
  L3 = "WanderResume"
  L2(L3)
  L2 = Event
  L3 = "SkittishResume"
  L2(L3)
  L2 = SetStateAndMove
  L3 = AI_MOVE
  L4 = GetWaypoint
  L4 = L4()
  L2(L3, L4)
end
L0.OnTauntEnd = L1
function L0()
  local L0, L1, L2
  L0 = GetState
  L0 = L0()
  L1 = AI_HALTED
  if L0 == L1 then
    return
  end
  L1 = Event
  L2 = "WanderPause"
  L1(L2)
  L1 = ClearTarget
  L1()
  L1 = StopMove
  L1()
end
TimerTaunt = L0
L0 = NonAggressiveTauntBehavior
return L0
