local L0_0, L1_1
L0_0 = 2
RUN_IN_FEAR = L0_0
L0_0 = 1
HOSTILE = L0_0
L0_0 = 0
INACTIVE = L0_0
L0_0 = 850
LEASH_RADIUS = L0_0
L0_0 = 750
LEASH_PROTECTION_RADIUS = L0_0
L0_0 = 750
INNER_RELEASH_RADIUS = L0_0
L0_0 = 1150
RELEASH_RADIUS = L0_0
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
L0_0 = 0.05
REGEN_PERCENT_PER_SECOND = L0_0
function L0_0(A0_2)
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  SetMyLeashedOrientation()
  InitTimer("TimerRetreat", 0.5, true)
  InitTimer("TimerAttack", 0, true)
  InitTimer("TimerFeared", 0.5, true)
  InitTimer("TimerRegen", 0.5, true)
  InitTimer("TimerTaunt", 0.5, true)
  InitTimer("TimerFlee", 0.5, true)
  StopTimer("TimerFlee")
  StopTimer("TimerFeared")
  StopTimer("TimerRegen")
  StopTimer("TimerTaunt")
end
OnInit = L0_0
function L0_0()
  TimerRegen()
  SetStateAndMoveToLeashedPos(AI_RETREAT)
  ClearValidTargets()
end
Retreat = L0_0
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
  local L1_11, L2_12
  L1_11 = GetState
  L1_11 = L1_11()
  L2_12 = AI_HALTED
  if L1_11 == L2_12 then
    return
  end
  L2_12 = GetRoamState
  L2_12 = L2_12()
  if L2_12 == INACTIVE then
    L2_12 = AI_RETREAT
    if L1_11 ~= L2_12 then
      L2_12 = AI_TAUNTED
      if L1_11 ~= L2_12 then
        L2_12 = AI_FEARED
        if L1_11 ~= L2_12 then
          L2_12 = AI_FLEEING
          if L1_11 ~= L2_12 then
            L2_12 = StopTimer
            L2_12("TimerRegen")
            L2_12 = SetStateAndCloseToTarget
            L2_12(AI_ATTACK, A0_10)
            L2_12 = SetRoamState
            L2_12(HOSTILE)
          end
        end
      end
    end
  else
    L2_12 = GetRoamState
    L2_12 = L2_12()
    if L2_12 == HOSTILE then
      L2_12 = AI_ATTACK
      if L1_11 == L2_12 then
        L2_12 = GetTarget
        L2_12 = L2_12()
        target = L2_12
        L2_12 = GetMyPos
        L2_12 = L2_12()
        A0_10 = FindTargetNearPosition(L2_12, LEASH_RADIUS)
        StopTimer("TimerRegen")
        if DistanceBetweenObjectCenterAndPoint(target, L2_12) > DistanceBetweenObjectCenterAndPoint(A0_10, L2_12) + 25 then
          SetStateAndCloseToTarget(AI_ATTACK, A0_10)
          SetRoamState(HOSTILE)
          SetLeashCounter(GetLeashCounter() + 1)
          if GetLeashCounter() > 10 then
            Retreat()
          end
        elseif not IsHeroAI(A0_10) and DistanceBetweenObjectCenterAndPoint(target, L2_12) > DistanceBetweenObjectCenterAndPoint(A0_10, L2_12) + 25 then
          SetStateAndCloseToTarget(AI_ATTACK, A0_10)
          SetRoamState(HOSTILE)
          SetLeashCounter(GetLeashCounter() + 1)
          if GetLeashCounter() > 10 then
            Retreat()
          end
        end
      end
    end
  end
  return
end
OnTakeDamage = L0_0
function L0_0(A0_13, A1_14)
  local L2_15, L3_16, L4_17
  L2_15 = GetState
  L2_15 = L2_15()
  L3_16 = AI_HALTED
  if L2_15 == L3_16 then
    return
  end
  L3_16 = AddValidTarget
  L4_17 = A1_14
  L3_16(L4_17)
  L3_16 = GetRoamState
  L3_16 = L3_16()
  L4_17 = INACTIVE
  if L3_16 == L4_17 then
    L3_16 = AI_RETREAT
    if L2_15 ~= L3_16 then
      L3_16 = AI_TAUNTED
      if L2_15 ~= L3_16 then
        L3_16 = AI_FEARED
        if L2_15 ~= L3_16 then
          L3_16 = AI_FLEEING
          if L2_15 ~= L3_16 then
            L3_16 = StopTimer
            L4_17 = "TimerRegen"
            L3_16(L4_17)
            L3_16 = SetStateAndCloseToTarget
            L4_17 = AI_ATTACK
            L3_16(L4_17, A1_14)
            L3_16 = SetRoamState
            L4_17 = HOSTILE
            L3_16(L4_17)
          end
        end
      end
    end
  else
    L3_16 = GetRoamState
    L3_16 = L3_16()
    L4_17 = HOSTILE
    if L3_16 == L4_17 then
      L3_16 = AI_ATTACK
      if L2_15 == L3_16 then
        L3_16 = GetTarget
        L3_16 = L3_16()
        target = L3_16
        L3_16 = GetMyPos
        L3_16 = L3_16()
        L4_17 = target
        if L4_17 ~= nil then
          L4_17 = FindTargetNearPosition
          L4_17 = L4_17(L3_16, LEASH_RADIUS)
          A1_14 = L4_17
          L4_17 = DistanceBetweenObjectCenterAndPoint
          L4_17 = L4_17(target, L3_16)
          StopTimer("TimerRegen")
          if L4_17 > DistanceBetweenObjectCenterAndPoint(A1_14, L3_16) + 25 then
            SetStateAndCloseToTarget(AI_ATTACK, A1_14)
            SetRoamState(HOSTILE)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > 10 then
              Retreat()
            end
          elseif not IsHeroAI(A1_14) and L4_17 > DistanceBetweenObjectCenterAndPoint(A1_14, L3_16) + 25 then
            SetStateAndCloseToTarget(AI_ATTACK, A1_14)
            SetRoamState(HOSTILE)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > 10 then
              Retreat()
            end
          end
        end
      end
    end
  end
  L3_16 = GetState
  L3_16 = L3_16()
  L4_17 = AI_RETREAT
  if L3_16 == L4_17 then
    L3_16 = GetMyLeashedPos
    L3_16 = L3_16()
    L4_17 = 9001
    if A1_14 ~= nil then
      L4_17 = DistanceBetweenObjectCenterAndPoint(A1_14, L3_16)
    end
    if A1_14 ~= nil and L4_17 <= LEASH_RADIUS and GetLeashCounter() < 3 then
      SetLeashCounter(GetLeashCounter() + 1)
      StopTimer("TimerRegen")
      SetStateAndCloseToTarget(AI_ATTACK, A1_14)
      SetRoamState(HOSTILE)
    elseif A1_14 ~= nil and GetDistToLeashedPos() <= INNER_RELEASH_RADIUS and L4_17 <= RELEASH_RADIUS and GetLeashCounter() < 3 then
      SetLeashCounter(GetLeashCounter() + 1)
      StopTimer("TimerRegen")
      SetStateAndCloseToTarget(AI_ATTACK, A1_14)
      SetRoamState(HOSTILE)
    end
  end
end
LeashedCallForHelp = L0_0
function L0_0(A0_18, A1_19)
  local L2_20, L3_21
  L2_20 = GetState
  L2_20 = L2_20()
  L3_21 = AI_HALTED
  if L2_20 == L3_21 then
    return
  end
  L3_21 = GetOwner
  L3_21 = L3_21(A1_19)
  if L3_21 == nil then
    L3_21 = GetGoldRedirectTarget(A1_19)
  end
  if L3_21 ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, L3_21)
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
  if tauntTarget ~= nil and GetState() ~= AI_FEARED then
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
  StopTimer("TimerTaunt")
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil and GetState() ~= AI_FEARED then
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
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil and GetState() ~= AI_FEARED then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    SetRoamState(HOSTILE)
  end
end
TimerTaunt = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  SetRoamState(RUN_IN_FEAR)
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
  SetRoamState(RUN_IN_FEAR)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
TimerFeared = L0_0
function L0_0()
  local L0_22, L1_23, L2_24, L3_25, L4_26
  L0_22 = GetRoamState
  L0_22 = L0_22()
  L1_23 = INACTIVE
  if L0_22 ~= L1_23 then
    L0_22 = GetRoamState
    L0_22 = L0_22()
    L1_23 = RUN_IN_FEAR
  elseif L0_22 == L1_23 then
    return
  end
  L0_22 = GetState
  L0_22 = L0_22()
  L1_23 = AI_HALTED
  if L0_22 == L1_23 then
    return
  end
  L1_23 = GetDistToLeashedPos
  L1_23 = L1_23()
  L2_24 = GetTarget
  L2_24 = L2_24()
  L3_25 = GetMyLeashedPos
  L3_25 = L3_25()
  L4_26 = LEASH_RADIUS
  L4_26 = L4_26 + 1
  if L2_24 ~= nil then
    L4_26 = DistanceBetweenObjectCenterAndPoint(L2_24, L3_25)
  end
  if L1_23 > LEASH_PROTECTION_RADIUS and L1_23 < LEASH_RADIUS and L4_26 > LEASH_RADIUS and L0_22 ~= AI_RETREAT and GetLeashCounter() < 3 then
    FindNewTarget()
    L2_24 = GetTarget()
    if L2_24 ~= nil then
      SetLeashCounter(GetLeashCounter() + 1)
    end
  elseif L1_23 > LEASH_RADIUS and L0_22 ~= AI_RETREAT then
    isLeashing = true
    ResetAndStartTimer("TimerRegen")
    Retreat()
  end
  if L0_22 == AI_RETREAT and IsMovementStopped() == true then
    if GetDistToRetreat() < 100 then
      OnStoppedMoving()
    else
      Retreat()
    end
  end
end
TimerRetreat = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_RETREAT then
    SetLeashOrientation()
    SetLeashCounter(0)
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
  end
end
OnStoppedMoving = L0_0
function L0_0()
  local L0_27, L1_28
  L0_27 = GetState
  L0_27 = L0_27()
  L1_28 = AI_HALTED
  if L0_27 == L1_28 then
    return
  end
  L1_28 = GetRoamState
  L1_28 = L1_28()
  if L1_28 ~= INACTIVE then
    L1_28 = GetRoamState
    L1_28 = L1_28()
    if L1_28 ~= RUN_IN_FEAR then
      L1_28 = AI_RETREAT
    end
  elseif L0_27 == L1_28 then
    return
  end
  L1_28 = AI_ATTACK
  if L0_27 ~= L1_28 then
    L1_28 = AI_TAUNTED
  elseif L0_27 == L1_28 then
    L1_28 = GetTarget
    L1_28 = L1_28()
    if L1_28 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_28)
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
  local L0_29, L1_30, L2_31, L3_32
  L0_29 = GetState
  L0_29 = L0_29()
  L1_30 = AI_HALTED
  if L0_29 == L1_30 then
    return
  end
  L1_30 = GetRoamState
  L1_30 = L1_30()
  L2_31 = INACTIVE
  if L1_30 ~= L2_31 then
    L1_30 = GetRoamState
    L1_30 = L1_30()
    L2_31 = RUN_IN_FEAR
    if L1_30 ~= L2_31 then
      L1_30 = GetState
      L1_30 = L1_30()
      L2_31 = AI_RETREAT
    end
  elseif L1_30 == L2_31 then
    return
  end
  L1_30 = GetMyLeashedPos
  L1_30 = L1_30()
  L2_31 = FindValidTargetNearPosition
  L3_32 = L1_30
  L2_31 = L2_31(L3_32, LEASH_RADIUS)
  L3_32 = LEASH_RADIUS
  L3_32 = L3_32 + 1
  if L2_31 ~= nil then
    L3_32 = DistanceBetweenObjectCenterAndPoint(L2_31, L1_30)
  end
  if L2_31 ~= nil and L3_32 <= LEASH_RADIUS then
    StopTimer("TimerRegen")
    SetStateAndCloseToTarget(AI_ATTACK, L2_31)
  else
    ResetAndStartTimer("TimerRegen")
    Retreat()
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
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetStateAndMove(AI_FLEEING, fleePoint)
  SetRoamState(RUN_IN_FEAR)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  ResetAndStartTimer("TimerFlee")
end
OnFleeBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFlee")
  SetRoamState(HOSTILE)
  NetSetState(AI_ATTACK)
  TimerRetreat()
  TimerAttack()
end
OnFleeEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetRoamState(RUN_IN_FEAR)
  SetStateAndMove(AI_FLEEING, fleePoint)
end
TimerFlee = L0_0
