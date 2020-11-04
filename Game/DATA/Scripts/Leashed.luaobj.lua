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
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  FindNewTarget()
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
  local L0_13, L1_14
  L0_13 = GetState
  L0_13 = L0_13()
  L1_14 = AI_HALTED
  if L0_13 == L1_14 then
    return
  end
  L1_14 = GetRoamState
  L1_14 = L1_14()
  if L1_14 ~= INACTIVE then
    L1_14 = AI_RETREAT
  elseif L0_13 == L1_14 then
    return
  end
  L1_14 = AI_ATTACK
  if L0_13 ~= L1_14 then
    L1_14 = AI_TAUNTED
  elseif L0_13 == L1_14 then
    L1_14 = GetTarget
    L1_14 = L1_14()
    if L1_14 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_14)
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
  local L0_15, L1_16, L2_17, L3_18
  L0_15 = GetState
  L0_15 = L0_15()
  L1_16 = AI_HALTED
  if L0_15 == L1_16 then
    return
  end
  L1_16 = GetRoamState
  L1_16 = L1_16()
  L2_17 = INACTIVE
  if L1_16 ~= L2_17 then
    L1_16 = GetState
    L1_16 = L1_16()
    L2_17 = AI_RETREAT
  elseif L1_16 == L2_17 then
    return
  end
  L1_16 = LEASH_RADIUS
  L2_17 = GetDistToLeashedPos
  L2_17 = L2_17()
  L1_16 = L1_16 - L2_17
  L2_17 = GetCharacterData
  L2_17 = L2_17()
  L3_18 = L2_17.mAttackRange
  L3_18 = L3_18 * 0.5
  L1_16 = L1_16 + L3_18
  L3_18 = FindTarget
  L3_18 = L3_18(L1_16)
  if L3_18 ~= nil then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, L3_18)
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
