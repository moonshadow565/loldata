local L0, L1, L2
L0 = {}
DefaultTauntBehavior = L0
L0 = RegisterForEvent
L1 = "OnTauntBegin"
L2 = DefaultTauntBehavior
L0(L1, L2)
L0 = RegisterForEvent
L1 = "OnTauntEnd"
L2 = DefaultTauntBehavior
L0(L1, L2)
L0 = DefaultTauntBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = GetTauntTarget
  L2 = L2()
  tauntTarget = L2
  L2 = tauntTarget
  if L2 ~= nil then
    L2 = AI_FEARED
    if L1 ~= L2 then
      L2 = OutOfCombatRegen
      L2 = L2.Stop
      L2()
      L2 = SetStateAndCloseToTarget
      L3 = AI_TAUNTED
      L4 = tauntTarget
      L2(L3, L4)
      L2 = SetRoamState
      L3 = HOSTILE
      L2(L3)
    end
  end
end
L0.OnTauntBegin = L1
L0 = DefaultTauntBehavior
function L1(A0)
  local L1, L2, L3, L4
  L1 = GetState
  L1 = L1()
  L2 = AI_HALTED
  if L1 == L2 then
    return
  end
  L2 = GetTauntTarget
  L2 = L2()
  tauntTarget = L2
  L2 = tauntTarget
  if L2 ~= nil then
    L2 = AI_FEARED
    if L1 ~= L2 then
      L2 = OutOfCombatRegen
      L2 = L2.Stop
      L2()
      L2 = SetStateAndCloseToTarget
      L3 = AI_ATTACK
      L4 = tauntTarget
      L2(L3, L4)
      L2 = SetRoamState
      L3 = HOSTILE
      L2(L3)
  end
  else
    L2 = NetSetState
    L3 = AI_ATTACK
    L2(L3)
    L2 = TimerRetreat
    L2()
    L2 = TimerAttack
    L2()
  end
end
L0.OnTauntEnd = L1
function L0()
  local L0, L1, L2, L3
  L0 = GetState
  L0 = L0()
  L1 = AI_HALTED
  if L0 == L1 then
    return
  end
  L1 = GetTauntTarget
  L1 = L1()
  tauntTarget = L1
  L1 = tauntTarget
  if L1 ~= nil then
    L1 = AI_FEARED
    if L0 ~= L1 then
      L1 = OutOfCombatRegen
      L1 = L1.Stop
      L1()
      L1 = SetStateAndCloseToTarget
      L2 = AI_TAUNTED
      L3 = tauntTarget
      L1(L2, L3)
      L1 = SetRoamState
      L2 = HOSTILE
      L1(L2)
    end
  end
end
TimerTaunt = L0
L0 = DefaultTauntBehavior
return L0
