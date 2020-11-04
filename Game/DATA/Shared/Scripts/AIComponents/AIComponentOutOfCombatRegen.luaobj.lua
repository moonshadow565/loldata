local L0, L1, L2
L0 = REGEN_PERCENT_PER_SECOND
if L0 == nil then
  L0 = 0.125
  REGEN_PERCENT_PER_SECOND = L0
end
L0 = {}
L0.TimerCallbackName = "TimerRegen"
OutOfCombatRegen = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = OutOfCombatRegen
L0(L1, L2)
L0 = RegisterForEvent
L1 = "ComponentHalt"
L2 = OutOfCombatRegen
L0(L1, L2)
L0 = OutOfCombatRegen
function L1(A0, A1, A2, A3)
  local L4, L5, L6, L7
  L4 = InitTimer
  L5 = A0.TimerCallbackName
  L6 = 1
  L7 = true
  L4(L5, L6, L7)
  L4 = OutOfCombatRegen
  L5 = L4
  L4 = L4.Stop
  L4(L5)
end
L0.ComponentInit = L1
L0 = OutOfCombatRegen
function L1(A0)
  local L1, L2
  L1 = OutOfCombatRegen
  L2 = L1
  L1 = L1.Stop
  L1(L2)
end
L0.ComponentHalt = L1
function L0()
  local L0, L1, L2, L3, L4, L5, L6
  L0 = GetState
  L0 = L0()
  L1 = AI_HALTED
  if L0 == L1 then
    return
  end
  L1 = GetMaxHP
  L1 = L1()
  L2 = REGEN_PERCENT_PER_SECOND
  L2 = L1 * L2
  L3 = GetHP
  L3 = L3()
  if 0 < L3 then
    L4 = L3 + L2
    L5 = SetHP
    L6 = L4
    L5(L6)
  end
end
TimerRegen = L0
L0 = OutOfCombatRegen
function L1(A0)
  local L1, L2
  L1 = ResetAndStartTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.Start = L1
L0 = OutOfCombatRegen
function L1(A0)
  local L1, L2
  L1 = StopTimer
  L2 = A0.TimerCallbackName
  L1(L2)
end
L0.Stop = L1
