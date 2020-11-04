local L0_0, L1_1
L0_0 = 1
HOSTILE = L0_0
L0_0 = 0
INACTIVE = L0_0
L0_0 = 700
LEASH_RADIUS = L0_0
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
L0_0 = 0.1
REGEN_PERCENT_PER_SECOND = L0_0
function L0_0(A0_2)
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  InitTimer("TimerRetreat", 0.5, true)
  InitTimer("TimerAttack", 0, true)
  InitTimer("TimerFeared", 1, true)
  InitTimer("TimerRegen", 1, true)
  StopTimer("TimerFeared")
  StopTimer("TimerRegen")
end
OnInit = L0_0
function L0_0()
  local L0_3, L1_4, L2_5, L3_6, L4_7
  L0_3 = GetState
  L0_3 = L0_3()
  L1_4 = AI_HALTED
  if L0_3 == L1_4 then
    return
  end
  L1_4 = GetMaxHP
  L1_4 = L1_4()
  L2_5 = REGEN_PERCENT_PER_SECOND
  L2_5 = L1_4 * L2_5
  L3_6 = GetHP
  L3_6 = L3_6()
  if L3_6 > 0 then
    L4_7 = L3_6 + L2_5
    SetHP(L4_7)
  end
end
TimerRegen = L0_0
function L0_0(A0_8, A1_9)
  if GetState() == AI_HALTED then
    return
  end
  if A0_8 == ORDER_ATTACKTO then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, A1_9)
    SetRoamState(HOSTILE)
    return true
  end
  Error("Unsupported Order")
  return false
end
OnOrder = L0_0
function L0_0(A0_10)
  if GetState() == AI_HALTED then
    return
  end
  if GetRoamState() == INACTIVE and GetState() ~= AI_RETREAT and GetState() ~= AI_TAUNTED and GetState() ~= AI_FEARED then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, A0_10)
    SetRoamState(HOSTILE)
  end
end
OnTakeDamage = L0_0
function L0_0(A0_11, A1_12)
  if GetState() == AI_HALTED then
    return
  end
  if GetRoamState() == INACTIVE and GetState() ~= AI_RETREAT and GetState() ~= AI_TAUNTED and GetState() ~= AI_FEARED then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, A1_12)
    SetRoamState(HOSTILE)
  end
end
LeashedCallForHelp = L0_0
function L0_0(A0_13, A1_14)
  local L2_15, L3_16
  L2_15 = GetState
  L2_15 = L2_15()
  L3_16 = AI_HALTED
  if L2_15 == L3_16 then
    return
  end
  L3_16 = GetOwner
  L3_16 = L3_16(A1_14)
  if L3_16 == nil then
    L3_16 = GetGoldRedirectTarget(A1_14)
  end
  if L3_16 ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, L3_16)
  else
    FindNewTarget()
  end
end
OnTargetLost = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    SetRoamState(HOSTILE)
  end
end
OnTauntBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    StopTimer("TimerRegen")
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
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  RoamState = INACTIVE
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFeared")
  SetRoamState(HOSTILE)
  NetSetState(AI_ATTACK)
  TimerRetreat()
  TimerAttack()
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
  if GetRoamState() == INACTIVE then
    return
  end
  if GetState() == AI_HALTED then
    return
  end
  if GetDistToLeashedPos() > LEASH_RADIUS and GetState() ~= AI_RETREAT then
    isLeashing = true
    ResetAndStartTimer("TimerRegen")
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
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_RETREAT then
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
  end
end
OnStoppedMoving = L0_0
function L0_0()
  local L0_17, L1_18
  L0_17 = GetState
  L0_17 = L0_17()
  L1_18 = AI_HALTED
  if L0_17 == L1_18 then
    return
  end
  L1_18 = GetRoamState
  L1_18 = L1_18()
  if L1_18 ~= INACTIVE then
    L1_18 = AI_RETREAT
  elseif L0_17 == L1_18 then
    return
  end
  L1_18 = AI_ATTACK
  if L0_17 ~= L1_18 then
    L1_18 = AI_TAUNTED
  elseif L0_17 == L1_18 then
    L1_18 = GetTarget
    L1_18 = L1_18()
    if L1_18 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_18)
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
  local L0_19, L1_20, L2_21, L3_22
  L0_19 = GetState
  L0_19 = L0_19()
  L1_20 = AI_HALTED
  if L0_19 == L1_20 then
    return
  end
  L1_20 = GetRoamState
  L1_20 = L1_20()
  L2_21 = INACTIVE
  if L1_20 ~= L2_21 then
    L1_20 = GetState
    L1_20 = L1_20()
    L2_21 = AI_RETREAT
  elseif L1_20 == L2_21 then
    return
  end
  L1_20 = LEASH_RADIUS
  L2_21 = GetDistToLeashedPos
  L2_21 = L2_21()
  L1_20 = L1_20 - L2_21
  L2_21 = GetCharacterData
  L2_21 = L2_21()
  L3_22 = L2_21.mAttackRange
  L3_22 = L3_22 * 0.5
  L1_20 = L1_20 + L3_22
  L3_22 = FindTarget
  L3_22 = L3_22(L1_20)
  if L3_22 ~= nil then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, L3_22)
  else
    ResetAndStartTimer("TimerRegen")
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
end
FindNewTarget = L0_0
function L0_0()
  StopTimer("TimerRetreat")
  StopTimer("TimerAttack")
  StopTimer("TimerFeared")
  StopTimer("TimerRegen")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
