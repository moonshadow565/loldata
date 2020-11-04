local L0_0, L1_1
L0_0 = 1
HOSTILE = L0_0
L0_0 = 0
INACTIVE = L0_0
L0_0 = 700
LEASH_RADIUS = L0_0
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
function L0_0(A0_2)
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  InitTimer("TimerRetreat", 0.5, true)
  InitTimer("TimerAttack", 0, true)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerFeared")
end
OnInit = L0_0
function L0_0(A0_3, A1_4)
  if A0_3 == ORDER_ATTACKTO then
    SetStateAndCloseToTarget(AI_ATTACK, A1_4)
    SetRoamState(HOSTILE)
    return true
  end
  Error("Unsupported Order")
  return false
end
OnOrder = L0_0
function L0_0(A0_5)
  aiState = GetState()
  if GetRoamState() == INACTIVE and aiState ~= AI_RETREAT and aiState ~= AI_TAUNTED and aiState ~= AI_FEARED then
    SetStateAndCloseToTarget(AI_ATTACK, A0_5)
    SetRoamState(HOSTILE)
  end
end
OnTakeDamage = L0_0
function L0_0(A0_6, A1_7)
  aiState = GetState()
  if GetRoamState() == INACTIVE and aiState ~= AI_RETREAT and aiState ~= AI_TAUNTED and aiState ~= AI_FEARED then
    SetStateAndCloseToTarget(AI_ATTACK, A1_7)
    SetRoamState(HOSTILE)
  end
end
LeashedCallForHelp = L0_0
function L0_0()
  FindNewTarget()
end
OnTargetLost = L0_0
function L0_0()
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    SetRoamState(HOSTILE)
  end
end
OnTauntBegin = L0_0
function L0_0()
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, tauntTarget)
    SetRoamState(HOSTILE)
  else
    NetSetState(AI_ATTACK)
    TimerRetreat()
    TimerAttack()
  end
end
OnTauntEnd = L0_0
function L0_0()
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  RoamState = INACTIVE
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  StopTimer("TimerFeared")
  SetRoamState(HOSTILE)
  NetSetState(AI_ATTACK)
  TimerRetreat()
  TimerAttack()
end
OnFearEnd = L0_0
function L0_0()
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
TimerFeared = L0_0
function L0_0()
  if GetRoamState() == INACTIVE then
    return
  end
  if GetDistToLeashedPos() > LEASH_RADIUS and GetState() ~= AI_RETREAT then
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
  if GetState() == AI_RETREAT and IsMovementStopped() == true then
    if GetDistToRetreat() < 100 then
      OnStoppedMoving()
    else
      SetStateAndMoveToLeashedPos(AI_RETREAT)
    end
  end
end
TimerRetreat = L0_0
function L0_0()
  if GetState() == AI_RETREAT then
    SetHPasMax()
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
  end
end
OnStoppedMoving = L0_0
function L0_0()
  local L0_8, L1_9
  L0_8 = GetState
  L0_8 = L0_8()
  L1_9 = GetRoamState
  L1_9 = L1_9()
  if L1_9 ~= INACTIVE then
    L1_9 = AI_RETREAT
  elseif L0_8 == L1_9 then
    return
  end
  L1_9 = AI_ATTACK
  if L0_8 ~= L1_9 then
    L1_9 = AI_TAUNTED
  elseif L0_8 == L1_9 then
    L1_9 = GetTarget
    L1_9 = L1_9()
    if L1_9 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_9)
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
    else
      FindNewTarget()
    end
  end
end
TimerAttack = L0_0
function L0_0()
  local L0_10, L1_11, L2_12
  L0_10 = GetRoamState
  L0_10 = L0_10()
  L1_11 = INACTIVE
  if L0_10 ~= L1_11 then
    L0_10 = GetState
    L0_10 = L0_10()
    L1_11 = AI_RETREAT
  elseif L0_10 == L1_11 then
    return
  end
  L0_10 = LEASH_RADIUS
  L1_11 = GetDistToLeashedPos
  L1_11 = L1_11()
  L0_10 = L0_10 - L1_11
  L1_11 = GetCharacterData
  L1_11 = L1_11()
  L2_12 = L1_11.mAttackRange
  L2_12 = L2_12 * 0.5
  L0_10 = L0_10 + L2_12
  L2_12 = FindTarget
  L2_12 = L2_12(L0_10)
  if L2_12 ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, L2_12)
  else
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
end
FindNewTarget = L0_0
