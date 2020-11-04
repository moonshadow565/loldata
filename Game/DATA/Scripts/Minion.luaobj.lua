MAX_ENGAGE_DISTANCE = 2500
FEAR_WANDER_DISTANCE = 500
DELAY_FIND_ENEMIES = 0.25
DoLuaShared("Minions")
function OnTauntBegin()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    StopTimer("TimerAntiKite")
  end
end
function OnTauntEnd()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, tauntTarget)
    ResetAndStartTimer("TimerAntiKite")
  else
    FindTargetOrMove()
  end
end
function TimerFindEnemies()
  local L0_0, L1_1
  L0_0 = GetState
  L0_0 = L0_0()
  L1_1 = AI_HALTED
  if L0_0 == L1_1 then
    return
  end
  L1_1 = AI_ATTACKMOVESTATE
  if L0_0 == L1_1 then
    L1_1 = FindTargetInAcR
    L1_1 = L1_1()
    if L1_1 == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L1_1)
    ResetAndStartTimer("TimerAntiKite")
  else
    L1_1 = AI_TAUNTED
    if L0_0 == L1_1 then
      L1_1 = GetTauntTarget
      L1_1 = L1_1()
      if L1_1 ~= nil then
        L1_1 = SetStateAndCloseToTarget
        L1_1(AI_TAUNTED, GetTauntTarget())
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
      L1_1 = L1_1(GetTarget())
    elseif L1_1 > MAX_ENGAGE_DISTANCE then
      L1_1 = FindTargetOrMove
      L1_1()
    end
    L1_1 = TargetInAttackRange
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = AI_TAUNTED
      if L0_0 ~= L1_1 then
        L1_1 = ResetAndStartTimer
        L1_1("TimerAntiKite")
      end
      L1_1 = TurnOnAutoAttack
      L1_1(GetTarget())
    else
      L1_1 = TargetInCancelAttackRange
      L1_1 = L1_1()
      if L1_1 == false then
        L1_1 = TurnOffAutoAttack
        L1_1(STOPREASON_MOVING)
        L1_1 = 0
        LastAttackScan = L1_1
      end
    end
  end
end
function FindTargetOrMove()
  local L0_2, L1_3
  L0_2 = GetState
  L0_2 = L0_2()
  L1_3 = AI_HALTED
  if L0_2 == L1_3 then
    L1_3 = TurnOffAutoAttack
    L1_3(STOPREASON_MOVING)
    return
  end
  L1_3 = FindTargetInAcR
  L1_3 = L1_3()
  if L1_3 then
    if LastAutoAttackFinished() == false then
      InitTimer("TimerFindEnemies", DELAY_FIND_ENEMIES, true)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L1_3)
    ResetAndStartTimer("TimerAntiKite")
  else
    TurnOffAutoAttack(STOPREASON_MOVING)
    SetStateAndMoveToForwardNav(AI_ATTACKMOVESTATE)
    StopTimer("TimerAntiKite")
    LastAttackScan = 0
  end
end
function TimerMoveForward()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_IDLE then
    FindTargetOrMove()
  elseif GetState() == AI_ATTACKMOVESTATE then
    SetStateAndMoveToForwardNav(AI_ATTACKMOVESTATE)
    LastAttackScan = 0
  end
end
