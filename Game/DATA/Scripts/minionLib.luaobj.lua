local L0_0, L1_1
function L0_0()
  SetState(AI_IDLE)
  InitTimer("TimerFindEnemies", DELAY_FIND_ENEMIES, true)
  InitTimer("TimerMoveForward", 0, true)
  InitTimer("TimerAntiKite", 4, false)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerAntiKite")
  StopTimer("TimerFeared")
  return false
end
OnInit = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_ATTACKMOVE_ATTACKING or GetState() == AI_TAUNTED then
    FindTargetOrMove()
  end
end
OnTargetLost = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_ATTACKMOVE_ATTACKING then
    AddToIgnore(0.1)
    FindTargetOrMove()
  end
end
OnPathToTargetBlocked = L0_0
function L0_0(A0_2, A1_3)
  if GetState() == AI_HALTED then
    return
  end
  if A1_3 and (GetState() == AI_ATTACKMOVESTATE or GetState() == AI_ATTACKMOVE_ATTACKING) then
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, A1_3)
    ResetAndStartTimer("TimerAntiKite")
  end
end
OnCallForHelp = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFeared")
  FindTargetOrMove()
end
OnFearEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
TimerFeared = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  FindTargetOrMove()
end
OnCanMove = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  FindTargetOrMove()
end
OnCanAttack = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_ATTACKMOVE_ATTACKING and IsMoving() then
    AddToIgnore(0.1)
    FindTargetOrMove()
  end
end
TimerAntiKite = L0_0
function L0_0(A0_4)
  if GetState() == AI_HALTED then
    return
  end
  if GetState() ~= AI_TAUNTED and GetState() ~= AI_FEARED then
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, A0_4)
    return false
  end
  return true
end
OnCollisionEnemy = L0_0
function L0_0(A0_5)
  local L1_6, L2_7
  L1_6 = GetState
  L1_6 = L1_6()
  L2_7 = AI_HALTED
  if L1_6 == L2_7 then
    return
  end
  L2_7 = AI_TAUNTED
  if L1_6 ~= L2_7 then
    L2_7 = AI_FEARED
    if L1_6 ~= L2_7 then
      L2_7 = FindTargetInAcR
      L2_7 = L2_7()
      if L2_7 ~= nil then
        SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L2_7)
      end
      return false
    end
  end
  L2_7 = true
  return L2_7
end
OnCollisionOther = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnReachedDestinationForGoingToLastLocation = L0_0
function L0_0()
  StopTimer("TimerFindEnemies")
  StopTimer("TimerMoveForward")
  StopTimer("TimerAntiKite")
  StopTimer("TimerFeared")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
