local L0_0, L1_1
L0_0 = 1
HOSTILE = L0_0
L0_0 = 0
INACTIVE = L0_0
L0_0 = 1000
LEASHED_RADIUS = L0_0
L0_0 = 100
SHORT_LEASH_RADIUS = L0_0
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
L0_0 = 50
WITHIN_CAMP_RANGE_MIN = L0_0
L0_0 = 250
WITHIN_CAMP_RANGE_MAX = L0_0
function L0_0(A0_2)
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  InitTimer("TimerRetreat", 0.4, true)
  InitTimer("TimerAttack", 0.5, true)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerFeared")
end
OnInit = L0_0
function L0_0(A0_3, A1_4, A2_5)
  if A0_3 == ORDER_ATTACKTO then
    SetStateAndCloseToTarget(AI_ATTACK, A2_5)
    return true
  end
  Error("Unsupported Order")
  return false
end
OnOrder = L0_0
function L0_0(A0_6)
  aiState = GetState()
  if GetRoamState() == INACTIVE and aiState ~= AI_RETREAT and aiState ~= AI_FEARED then
    SetStateAndCloseToTarget(AI_ATTACK, A0_6)
    SetRoamState(HOSTILE)
  end
end
OnTakeDamage = L0_0
function L0_0(A0_7, A1_8)
  aiState = GetState()
  if aiState ~= AI_RETREAT and aiState ~= AI_TAUNTED and aiState ~= AI_FEARED then
    SetStateAndCloseToTarget(AI_ATTACK, A1_8)
    SetRoamState(HOSTILE)
  end
end
LeashedCallForHelp = L0_0
function L0_0()
  local L0_9, L1_10
  L0_9 = GetState
  L0_9 = L0_9()
  L1_10 = AI_ATTACK
  if L0_9 ~= L1_10 then
    L1_10 = AI_TAUNTED
  elseif L0_9 == L1_10 then
    L1_10 = GetCanIAttack
    L1_10 = L1_10()
    if L1_10 == true then
      L1_10 = FindTargetInAcR
      L1_10 = L1_10()
      if GetDistToLeashedPos() > SHORT_LEASH_RADIUS and L1_10 == nil then
        FindNewTarget()
      elseif L1_10 == nil then
        FindNewTarget()
      else
        SetStateAndCloseToTarget(AI_ATTACK, L1_10)
      end
    end
  end
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
  local L0_11, L1_12, L2_13
  L0_11 = GetState
  L0_11 = L0_11()
  L1_12 = GetDistToLeashedPos
  L1_12 = L1_12()
  L2_13 = AI_ATTACK
  if L0_11 ~= L2_13 then
    L2_13 = AI_TAUNTED
  elseif L0_11 == L2_13 then
    L2_13 = LEASHED_RADIUS
    if L1_12 > L2_13 then
      L2_13 = SetStateAndMoveToLeashedPos
      L2_13(AI_RETREAT)
    end
  end
  L2_13 = IsMovementStopped
  L2_13 = L2_13()
  if L2_13 == true then
    L2_13 = WITHIN_CAMP_RANGE_MAX
    if L1_12 < L2_13 then
      L2_13 = OnStoppedMoving
      L2_13()
    else
      L2_13 = GetTarget
      L2_13 = L2_13()
      if L2_13 ~= nil then
        if TargetInAttackRange() == false then
          SetStateAndMoveToLeashedPos(AI_RETREAT)
        else
          SetStateAndCloseToTarget(AI_ATTACK, L2_13)
        end
      else
        FindNewTarget()
      end
    end
  else
    L2_13 = WITHIN_CAMP_RANGE_MIN
    if L1_12 < L2_13 then
      L2_13 = OnStoppedMoving
      L2_13()
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
  local L0_14, L1_15
  L0_14 = GetState
  L0_14 = L0_14()
  L1_15 = GetRoamState
  L1_15 = L1_15()
  if L1_15 ~= INACTIVE then
    L1_15 = AI_RETREAT
  elseif L0_14 == L1_15 then
    return
  end
  L1_15 = AI_ATTACK
  if L0_14 ~= L1_15 then
    L1_15 = AI_TAUNTED
  elseif L0_14 == L1_15 then
    L1_15 = GetTarget
    L1_15 = L1_15()
    if L1_15 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_15)
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
  local L0_16, L1_17, L2_18
  L0_16 = GetRoamState
  L0_16 = L0_16()
  L1_17 = INACTIVE
  if L0_16 == L1_17 then
    return
  end
  L0_16 = LEASHED_RADIUS
  L1_17 = GetDistToLeashedPos
  L1_17 = L1_17()
  L0_16 = L0_16 - L1_17
  L1_17 = GetCharacterData
  L1_17 = L1_17()
  L2_18 = L1_17.mAttackRange
  L2_18 = L2_18 * 0.5
  L0_16 = L0_16 + L2_18
  L2_18 = FindTarget
  L2_18 = L2_18(L0_16)
  if L2_18 ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, L2_18)
  elseif GetCanIMove() then
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
end
FindNewTarget = L0_0
