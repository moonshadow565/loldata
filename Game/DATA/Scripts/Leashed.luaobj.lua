RUN_IN_FEAR = 2
HOSTILE = 1
INACTIVE = 0
LEASH_RADIUS = 850
LEASH_PROTECTION_RADIUS = 750
INNER_RELEASH_RADIUS = 750
RELEASH_RADIUS = 1150
FEAR_WANDER_DISTANCE = 500
VERY_FAR_DISTANCE = 9000
LEASH_COUNTER_THRESHOLD = 10
DoLuaShared("AIComponentSystem")
AddComponent("OutOfCombatRegen")
AddComponent("DefaultFearBehavior")
AddComponent("DefaultFleeBehavior")
AddComponent("DefaultTauntBehavior")
function OnInit(A0_0)
  Event("ComponentInit")
  SetState(AI_ATTACK)
  SetMyLeashedPos()
  SetMyLeashedOrientation()
  InitTimer("TimerRetreat", 0.5, true)
  InitTimer("TimerAttack", 0, true)
end
function Retreat()
  SetStateAndMoveToLeashedPos(AI_RETREAT)
end
function OnOrder(A0_1, A1_2)
  if GetState() == AI_HALTED then
    return
  end
  if A0_1 == ORDER_ATTACKTO then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, A1_2)
    SetRoamState(HOSTILE)
    return true
  end
  Error("Unsupported Order")
  return false
end
function OnTakeDamage(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = GetState
  L1_4 = L1_4()
  L2_5 = AI_HALTED
  if L1_4 == L2_5 then
    return
  end
  L2_5 = GetMyPos
  L2_5 = L2_5()
  L3_6 = FindTargetNearPosition
  L3_6 = L3_6(L2_5, LEASH_RADIUS)
  if L3_6 == nil then
    L3_6 = A0_3
    if A0_3 == nil then
      return
    end
  end
  if GetRoamState() == INACTIVE and L1_4 ~= AI_RETREAT and L1_4 ~= AI_TAUNTED and L1_4 ~= AI_FEARED and L1_4 ~= AI_FLEEING then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, L3_6)
    SetRoamState(HOSTILE)
  elseif GetRoamState() == HOSTILE and L1_4 == AI_ATTACK then
    OutOfCombatRegen:Stop()
    target = GetTarget()
    if target ~= nil then
      if DistanceBetweenObjectCenterAndPoint(target, L2_5) > DistanceBetweenObjectCenterAndPoint(L3_6, L2_5) + 25 then
        SetStateAndCloseToTarget(AI_ATTACK, L3_6)
        SetRoamState(HOSTILE)
        SetLeashCounter(GetLeashCounter() + 1)
        if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
          Retreat()
        end
      elseif not IsHeroAI(L3_6) and DistanceBetweenObjectCenterAndPoint(target, L2_5) > DistanceBetweenObjectCenterAndPoint(L3_6, L2_5) + 25 then
        SetStateAndCloseToTarget(AI_ATTACK, L3_6)
        SetRoamState(HOSTILE)
        SetLeashCounter(GetLeashCounter() + 1)
        if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
          Retreat()
        end
      end
    end
  end
  return
end
function LeashedCallForHelp(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12
  L2_9 = GetState
  L2_9 = L2_9()
  L3_10 = AI_HALTED
  if L2_9 == L3_10 then
    return
  end
  L3_10 = GetMyPos
  L3_10 = L3_10()
  L4_11 = FindTargetNearPosition
  L5_12 = L3_10
  L4_11 = L4_11(L5_12, LEASH_RADIUS)
  if L4_11 == nil then
    L4_11 = A1_8
    if A1_8 == nil then
      return
    end
  end
  L5_12 = GetRoamState
  L5_12 = L5_12()
  if L5_12 == INACTIVE then
    L5_12 = AI_RETREAT
    if L2_9 ~= L5_12 then
      L5_12 = AI_TAUNTED
      if L2_9 ~= L5_12 then
        L5_12 = AI_FEARED
        if L2_9 ~= L5_12 then
          L5_12 = AI_FLEEING
          if L2_9 ~= L5_12 then
            L5_12 = OutOfCombatRegen
            L5_12 = L5_12.Stop
            L5_12(L5_12)
            L5_12 = SetStateAndCloseToTarget
            L5_12(AI_ATTACK, L4_11)
            L5_12 = SetRoamState
            L5_12(HOSTILE)
          end
        end
      end
    end
  else
    L5_12 = GetRoamState
    L5_12 = L5_12()
    if L5_12 == HOSTILE then
      L5_12 = AI_ATTACK
      if L2_9 == L5_12 then
        L5_12 = GetTarget
        L5_12 = L5_12()
        target = L5_12
        L5_12 = GetMyPos
        L5_12 = L5_12()
        if target ~= nil then
          OutOfCombatRegen:Stop()
          if DistanceBetweenObjectCenterAndPoint(target, L5_12) > DistanceBetweenObjectCenterAndPoint(L4_11, L5_12) + 25 then
            SetStateAndCloseToTarget(AI_ATTACK, L4_11)
            SetRoamState(HOSTILE)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
              Retreat()
            end
          elseif not IsHeroAI(L4_11) and DistanceBetweenObjectCenterAndPoint(target, L5_12) > DistanceBetweenObjectCenterAndPoint(L4_11, L5_12) + 25 then
            SetStateAndCloseToTarget(AI_ATTACK, L4_11)
            SetRoamState(HOSTILE)
            SetLeashCounter(GetLeashCounter() + 1)
            if GetLeashCounter() > LEASH_COUNTER_THRESHOLD then
              Retreat()
            end
          end
        end
      end
    end
  end
  L5_12 = GetState
  L5_12 = L5_12()
  if L5_12 == AI_RETREAT then
    L5_12 = GetMyLeashedPos
    L5_12 = L5_12()
    if DistanceBetweenObjectCenterAndPoint(L4_11, L5_12) <= LEASH_RADIUS and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
      SetLeashCounter(GetLeashCounter() + 1)
      OutOfCombatRegen:Stop()
      SetStateAndCloseToTarget(AI_ATTACK, L4_11)
      SetRoamState(HOSTILE)
    elseif GetDistToLeashedPos() <= INNER_RELEASH_RADIUS and DistanceBetweenObjectCenterAndPoint(L4_11, L5_12) <= RELEASH_RADIUS and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
      SetLeashCounter(GetLeashCounter() + 1)
      OutOfCombatRegen:Stop()
      SetStateAndCloseToTarget(AI_ATTACK, L4_11)
      SetRoamState(HOSTILE)
    end
  end
end
function OnTargetLost(A0_13, A1_14)
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
function TimerRetreat()
  local L0_17, L1_18, L2_19, L3_20, L4_21
  L0_17 = GetRoamState
  L0_17 = L0_17()
  L1_18 = INACTIVE
  if L0_17 ~= L1_18 then
    L0_17 = GetRoamState
    L0_17 = L0_17()
    L1_18 = RUN_IN_FEAR
  elseif L0_17 == L1_18 then
    return
  end
  L0_17 = GetState
  L0_17 = L0_17()
  L1_18 = AI_HALTED
  if L0_17 == L1_18 then
    return
  end
  L1_18 = GetDistToLeashedPos
  L1_18 = L1_18()
  L2_19 = GetTarget
  L2_19 = L2_19()
  L3_20 = GetMyLeashedPos
  L3_20 = L3_20()
  L4_21 = LEASH_RADIUS
  L4_21 = L4_21 + 1
  if L2_19 ~= nil then
    L4_21 = DistanceBetweenObjectCenterAndPoint(L2_19, L3_20)
  end
  if L1_18 > LEASH_PROTECTION_RADIUS and L1_18 < LEASH_RADIUS and L4_21 > LEASH_RADIUS and L0_17 ~= AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    FindNewTarget()
    L2_19 = GetTarget()
    if L2_19 ~= nil then
      SetLeashCounter(GetLeashCounter() + 1)
    end
  elseif L1_18 > LEASH_RADIUS and L0_17 ~= AI_RETREAT then
    isLeashing = true
    OutOfCombatRegen:Start()
    Retreat()
  end
  if L0_17 == AI_ATTACK and IsMovementStopped() == true and GetCanIMove() == true then
    FindNewTarget()
  end
  if L0_17 == AI_RETREAT and IsMovementStopped() == true then
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
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
  end
end
function TimerAttack()
  local L0_22, L1_23
  L0_22 = GetState
  L0_22 = L0_22()
  L1_23 = AI_HALTED
  if L0_22 == L1_23 then
    return
  end
  L1_23 = GetRoamState
  L1_23 = L1_23()
  if L1_23 ~= INACTIVE then
    L1_23 = GetRoamState
    L1_23 = L1_23()
    if L1_23 ~= RUN_IN_FEAR then
      L1_23 = AI_RETREAT
    end
  elseif L0_22 == L1_23 then
    return
  end
  L1_23 = AI_ATTACK
  if L0_22 ~= L1_23 then
    L1_23 = AI_TAUNTED
  elseif L0_22 == L1_23 then
    L1_23 = GetTarget
    L1_23 = L1_23()
    if L1_23 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_23)
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
    else
      FindNewTarget()
    end
  end
end
function FindNewTarget()
  local L0_24, L1_25, L2_26, L3_27
  L0_24 = GetState
  L0_24 = L0_24()
  L1_25 = AI_HALTED
  if L0_24 == L1_25 then
    return
  end
  L1_25 = GetRoamState
  L1_25 = L1_25()
  L2_26 = INACTIVE
  if L1_25 ~= L2_26 then
    L1_25 = GetRoamState
    L1_25 = L1_25()
    L2_26 = RUN_IN_FEAR
    if L1_25 ~= L2_26 then
      L1_25 = GetState
      L1_25 = L1_25()
      L2_26 = AI_RETREAT
    end
  elseif L1_25 == L2_26 then
    return
  end
  L1_25 = GetMyLeashedPos
  L1_25 = L1_25()
  L2_26 = FindTargetNearPosition
  L3_27 = L1_25
  L2_26 = L2_26(L3_27, LEASH_RADIUS)
  L3_27 = LEASH_RADIUS
  L3_27 = L3_27 + 1
  if L2_26 ~= nil then
    L3_27 = DistanceBetweenObjectCenterAndPoint(L2_26, L1_25)
  end
  if L2_26 ~= nil and L3_27 <= LEASH_RADIUS then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, L2_26)
  else
    OutOfCombatRegen:Start()
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
