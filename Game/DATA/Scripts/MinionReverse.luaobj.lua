MAX_ENGAGE_DISTANCE = 550
FEAR_WANDER_DISTANCE = 500
DELAY_FIND_ENEMIES = 0.25
dofile("Data\\Scripts\\minionLib.luaobj")
function OnTauntBegin()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    if IsObjectUseable(tauntTarget) then
      UseTarget(tauntTarget)
    else
      SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    end
    StopTimer("TimerAntiKite")
  end
end
function OnTauntEnd()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    if IsObjectUseable(tauntTarget) then
      UseTarget(tauntTarget)
    else
      SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, tauntTarget)
    end
    ResetAndStartTimer("TimerAntiKite")
  else
    FindTargetOrMove()
  end
end
function TimerMoveForward()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_IDLE then
    FindTargetOrMove()
  elseif GetState() == AI_ATTACKMOVESTATE then
    SetStateAndMoveToBackwardNav(AI_ATTACKMOVESTATE)
    LastAttackScan = 0
  end
end
function TimerFindEnemies()
  local L0_0, L1_1, L2_2
  L0_0 = GetState
  L0_0 = L0_0()
  L1_1 = AI_HALTED
  if L0_0 == L1_1 then
    return
  end
  L1_1 = AI_ATTACKMOVESTATE
  if L0_0 == L1_1 then
    L1_1 = FindUseableObjectInAcR
    L1_1 = L1_1()
    if L1_1 ~= nil then
      L2_2 = NetSetState
      L2_2(AI_IDLE)
      L2_2 = TurnOffAutoAttack
      L2_2(STOPREASON_MOVING)
      L2_2 = UseTarget
      L2_2(L1_1)
      return
    end
    L2_2 = FindTargetInAcR
    L2_2 = L2_2()
    if L2_2 == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L2_2)
    ResetAndStartTimer("TimerAntiKite")
  else
    L1_1 = GetTauntTarget
    L1_1 = L1_1()
    tauntTarget = L1_1
    L1_1 = AI_TAUNTED
    if L0_0 == L1_1 then
      L1_1 = tauntTarget
      if L1_1 ~= nil then
        L1_1 = IsObjectUseable
        L2_2 = tauntTarget
        L1_1 = L1_1(L2_2)
        if L1_1 then
          L1_1 = UseTarget
          L2_2 = tauntTarget
          L1_1(L2_2)
        else
          L1_1 = SetStateAndCloseToTarget
          L2_2 = AI_TAUNTED
          L1_1(L2_2, tauntTarget)
        end
      end
    end
  end
  L1_1 = AI_ATTACKMOVE_ATTACKING
  if L0_0 ~= L1_1 then
    L1_1 = AI_TAUNTED
  elseif L0_0 == L1_1 then
    L1_1 = GetTarget
    L1_1 = L1_1()
    if L1_1 ~= nil then
      L1_1 = DistanceBetweenMeAndObject
      L2_2 = GetTarget
      L2_2 = L2_2()
      L1_1 = L1_1(L2_2, L2_2())
      L2_2 = MAX_ENGAGE_DISTANCE
    elseif L1_1 > L2_2 then
      L1_1 = FindTargetOrMove
      L1_1()
    end
    L1_1 = TargetInAttackRange
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = AI_TAUNTED
      if L0_0 ~= L1_1 then
        L1_1 = ResetAndStartTimer
        L2_2 = "TimerAntiKite"
        L1_1(L2_2)
      end
      L1_1 = TurnOnAutoAttack
      L2_2 = GetTarget
      L2_2 = L2_2()
      L1_1(L2_2, L2_2())
    else
      L1_1 = TargetInCancelAttackRange
      L1_1 = L1_1()
      if L1_1 == false then
        L1_1 = TurnOffAutoAttack
        L2_2 = STOPREASON_MOVING
        L1_1(L2_2)
        L1_1 = 0
        LastAttackScan = L1_1
      end
    end
  end
end
function FindTargetOrMove()
  local L0_3, L1_4, L2_5
  L0_3 = GetState
  L0_3 = L0_3()
  L1_4 = AI_HALTED
  if L0_3 == L1_4 then
    return
  end
  L1_4 = FindUseableObjectInAcR
  L1_4 = L1_4()
  if L1_4 ~= nil then
    L2_5 = NetSetState
    L2_5(AI_IDLE)
    L2_5 = TurnOffAutoAttack
    L2_5(STOPREASON_MOVING)
    L2_5 = UseTarget
    L2_5(L1_4)
    return
  end
  L2_5 = FindTargetInAcR
  L2_5 = L2_5()
  if L2_5 then
    if LastAutoAttackFinished() == false then
      InitTimer("TimerFindEnemies", DELAY_FIND_ENEMIES, true)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L2_5)
    ResetAndStartTimer("TimerAntiKite")
  else
    SetStateAndMoveToBackwardNav(AI_ATTACKMOVESTATE)
    StopTimer("TimerAntiKite")
    LastAttackScan = 0
  end
end
