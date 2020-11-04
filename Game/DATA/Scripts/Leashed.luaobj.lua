RUN_IN_FEAR = 2
HOSTILE = 1
INACTIVE = 0
LEASH_RADIUS = 800
LEASH_PROTECTION_RADIUS = 700
INNER_RELEASH_RADIUS = 700
RELEASH_RADIUS = 1150
FEAR_WANDER_DISTANCE = 500
VERY_FAR_DISTANCE = 9000
LEASH_COUNTER_THRESHOLD = 6
DoLuaShared("AIComponentSystem")
AddComponent("OutOfCombatRegen")
AddComponent("DefaultFearBehavior")
AddComponent("DefaultFleeBehavior")
AddComponent("DefaultTauntBehavior")
inStasis = false
function OnInit(A0_0)
  Event("ComponentInit")
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  SetMyLeashedOrientation()
  InitTimer("TimerRetreat", 0.5, true)
  InitTimer("TimerAttack", 0, true)
end
function AttackTarget(A0_1)
  OutOfCombatRegen:Stop()
  SetGhosted(false)
  SetStateAndCloseToTarget(AI_ATTACK, A0_1)
  SetRoamState(HOSTILE)
end
function Retreat()
  SetGhosted(true)
  SetStateAndMoveToLeashedPos(AI_RETREAT)
  TurnOffAutoAttack(STOPREASON_MOVING)
end
function OnOrder(A0_2, A1_3)
  if GetState() == AI_HALTED then
    return
  end
  if A0_2 == ORDER_ATTACKTO then
    AttackTarget(A1_3)
    return true
  end
  Error("Unsupported Order")
  return false
end
function OnTakeDamage(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = GetState
  L1_5 = L1_5()
  L2_6 = AI_HALTED
  if L1_5 == L2_6 then
    return
  end
  L2_6 = GetMyPos
  L2_6 = L2_6()
  L3_7 = FindTargetNearPosition
  L3_7 = L3_7(L2_6, LEASH_RADIUS)
  if L3_7 == nil then
    L3_7 = A0_4
    if A0_4 == nil then
      return
    end
  end
  if GetRoamState() == INACTIVE and L1_5 ~= AI_RETREAT and L1_5 ~= AI_TAUNTED and L1_5 ~= AI_FEARED and L1_5 ~= AI_FLEEING then
    AttackTarget(L3_7)
  elseif GetRoamState() == HOSTILE and L1_5 == AI_ATTACK then
    OutOfCombatRegen:Stop()
    target = GetTarget()
    if target ~= nil then
      if DistanceBetweenObjectCenterAndPoint(target, L2_6) > DistanceBetweenObjectCenterAndPoint(L3_7, L2_6) + 25 then
        AttackTarget(L3_7)
        SetLeashCounter(GetLeashCounter() + 1)
        if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
          Retreat()
        end
      elseif not IsHeroAI(L3_7) and DistanceBetweenObjectCenterAndPoint(target, L2_6) > DistanceBetweenObjectCenterAndPoint(L3_7, L2_6) + 25 then
        AttackTarget(L3_7)
        SetLeashCounter(GetLeashCounter() + 1)
        if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
          Retreat()
        end
      end
    end
  end
  return
end
function LeashedCallForHelp(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13
  L2_10 = GetState
  L2_10 = L2_10()
  L3_11 = AI_HALTED
  if L2_10 == L3_11 then
    return
  end
  L3_11 = GetMyPos
  L3_11 = L3_11()
  L4_12 = FindTargetNearPosition
  L5_13 = L3_11
  L4_12 = L4_12(L5_13, LEASH_RADIUS)
  if L4_12 == nil then
    L4_12 = A1_9
    if A1_9 == nil then
      return
    end
  end
  L5_13 = GetRoamState
  L5_13 = L5_13()
  if L5_13 == INACTIVE then
    L5_13 = AI_RETREAT
    if L2_10 ~= L5_13 then
      L5_13 = AI_TAUNTED
      if L2_10 ~= L5_13 then
        L5_13 = AI_FEARED
        if L2_10 ~= L5_13 then
          L5_13 = AI_FLEEING
          if L2_10 ~= L5_13 then
            L5_13 = AttackTarget
            L5_13(L4_12)
          end
        end
      end
    end
  else
    L5_13 = GetRoamState
    L5_13 = L5_13()
    if L5_13 == HOSTILE then
      L5_13 = AI_ATTACK
      if L2_10 == L5_13 then
        L5_13 = GetTarget
        L5_13 = L5_13()
        target = L5_13
        L5_13 = GetMyPos
        L5_13 = L5_13()
        if target ~= nil then
          OutOfCombatRegen:Stop()
          if DistanceBetweenObjectCenterAndPoint(target, L5_13) > DistanceBetweenObjectCenterAndPoint(L4_12, L5_13) + 25 then
            AttackTarget(L4_12)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
              Retreat()
            end
          elseif not IsHeroAI(L4_12) and DistanceBetweenObjectCenterAndPoint(target, L5_13) > DistanceBetweenObjectCenterAndPoint(L4_12, L5_13) + 25 then
            AttackTarget(L4_12)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
              Retreat()
            end
          end
        end
      end
    end
  end
  L5_13 = GetState
  L5_13 = L5_13()
  if L5_13 == AI_RETREAT then
    L5_13 = GetMyLeashedPos
    L5_13 = L5_13()
    if DistanceBetweenObjectCenterAndPoint(L4_12, L5_13) <= LEASH_RADIUS and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
      SetLeashCounter(GetLeashCounter() + 1)
      AttackTarget(L4_12)
    elseif GetDistToLeashedPos() <= INNER_RELEASH_RADIUS and DistanceBetweenObjectCenterAndPoint(L4_12, L5_13) <= RELEASH_RADIUS and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
      SetLeashCounter(GetLeashCounter() + 1)
      AttackTarget(L4_12)
    end
  end
end
function OnTargetLost(A0_14, A1_15)
  local L2_16, L3_17
  L2_16 = TurnOffAutoAttack
  L3_17 = STOPREASON_MOVING
  L2_16(L3_17)
  L2_16 = GetState
  L2_16 = L2_16()
  L3_17 = AI_HALTED
  if L2_16 == L3_17 then
    return
  end
  L3_17 = inStasis
  if L3_17 == true then
    return
  end
  L3_17 = GetOwner
  L3_17 = L3_17(A1_15)
  if L3_17 == nil then
    L3_17 = GetGoldRedirectTarget(A1_15)
  end
  if L3_17 ~= nil then
    SetStateAndCloseToTarget(AI_ATTACK, L3_17)
  else
    FindNewTarget()
  end
end
function TimerRetreat()
  local L0_18, L1_19, L2_20, L3_21, L4_22
  L0_18 = GetRoamState
  L0_18 = L0_18()
  L1_19 = INACTIVE
  if L0_18 ~= L1_19 then
    L0_18 = GetRoamState
    L0_18 = L0_18()
    L1_19 = RUN_IN_FEAR
  elseif L0_18 == L1_19 then
    return
  end
  L0_18 = GetState
  L0_18 = L0_18()
  L1_19 = AI_HALTED
  if L0_18 == L1_19 then
    return
  end
  L1_19 = inStasis
  if L1_19 == true then
    return
  end
  L1_19 = GetDistToLeashedPos
  L1_19 = L1_19()
  L2_20 = GetTarget
  L2_20 = L2_20()
  L3_21 = GetMyLeashedPos
  L3_21 = L3_21()
  L4_22 = LEASH_RADIUS
  L4_22 = L4_22 + 1
  if L2_20 ~= nil then
    L4_22 = DistanceBetweenObjectCenterAndPoint(L2_20, L3_21)
  end
  if L1_19 > LEASH_PROTECTION_RADIUS and L1_19 < LEASH_RADIUS and L4_22 > LEASH_RADIUS and L0_18 ~= AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    FindNewTarget()
    L2_20 = GetTarget()
    if L2_20 ~= nil then
      SetLeashCounter(GetLeashCounter() + 1)
    else
      SetLeashCounter(GetLeashCounter() + 2)
    end
  elseif L1_19 > LEASH_RADIUS and L0_18 ~= AI_RETREAT then
    isLeashing = true
    SetLeashCounter(GetLeashCounter() + 1)
    OutOfCombatRegen:Start()
    Retreat()
  end
  if L0_18 == AI_ATTACK and IsMovementStopped() == true and GetCanIMove() == true then
    FindNewTarget()
  end
  if L0_18 == AI_RETREAT and IsMovementStopped() == true then
    if GetDistToRetreat() < 100 then
      OnStoppedMoving()
    else
      Retreat()
    end
  end
end
function OnStoppedMoving()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_RETREAT then
    SetLeashOrientation()
    SetLeashCounter(0)
    SetGhosted(false)
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
  end
end
function TimerAttack()
  local L0_23, L1_24
  L0_23 = GetState
  L0_23 = L0_23()
  L1_24 = AI_HALTED
  if L0_23 == L1_24 then
    return
  end
  L1_24 = inStasis
  if L1_24 == true then
    return
  end
  L1_24 = GetRoamState
  L1_24 = L1_24()
  if L1_24 ~= INACTIVE then
    L1_24 = GetRoamState
    L1_24 = L1_24()
    if L1_24 ~= RUN_IN_FEAR then
      L1_24 = AI_RETREAT
    end
  elseif L0_23 == L1_24 then
    return
  end
  L1_24 = AI_ATTACK
  if L0_23 ~= L1_24 then
    L1_24 = AI_TAUNTED
  elseif L0_23 == L1_24 then
    L1_24 = GetTarget
    L1_24 = L1_24()
    if L1_24 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_24)
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
    else
      FindNewTarget()
    end
  end
end
function FindNewTarget()
  local L0_25, L1_26, L2_27, L3_28
  L0_25 = GetState
  L0_25 = L0_25()
  L1_26 = AI_HALTED
  if L0_25 == L1_26 then
    return
  end
  L1_26 = GetRoamState
  L1_26 = L1_26()
  L2_27 = INACTIVE
  if L1_26 ~= L2_27 then
    L1_26 = GetRoamState
    L1_26 = L1_26()
    L2_27 = RUN_IN_FEAR
    if L1_26 ~= L2_27 then
      L1_26 = GetState
      L1_26 = L1_26()
      L2_27 = AI_RETREAT
    end
  elseif L1_26 == L2_27 then
    L1_26 = TurnOffAutoAttack
    L2_27 = STOPREASON_MOVING
    L1_26(L2_27)
    return
  end
  L1_26 = GetMyLeashedPos
  L1_26 = L1_26()
  L2_27 = FindTargetNearPosition
  L3_28 = L1_26
  L2_27 = L2_27(L3_28, LEASH_RADIUS)
  L3_28 = LEASH_RADIUS
  L3_28 = L3_28 + 1
  if L2_27 ~= nil then
    L3_28 = DistanceBetweenObjectCenterAndPoint(L2_27, L1_26)
  end
  if L2_27 ~= nil and L3_28 <= LEASH_RADIUS then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, L2_27)
  else
    TurnOffAutoAttack(STOPREASON_MOVING)
    OutOfCombatRegen:Start()
    SetLeashCounter(GetLeashCounter() + 1)
    Retreat()
  end
end
function HaltAI()
  Event("ComponentHalt")
  StopTimer("TimerRetreat")
  StopTimer("TimerAttack")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
function StopLeashing()
  OutOfCombatRegen:Stop()
  SetLeashCounter(0)
  StopTimer("TimerRetreat")
  StopTimer("TimerAttack")
end
function StartLeashing()
  SetLeashCounter(0)
  ResetAndStartTimer("TimerRetreat")
  ResetAndStartTimer("TimerAttack")
end
function EnterStasis()
  local L1_29
  L1_29 = true
  inStasis = L1_29
end
function ExitStasis()
  inStasis = false
  FindNewTarget()
end
