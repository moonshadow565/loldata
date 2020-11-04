RUN_IN_FEAR = 2
HOSTILE = 1
INACTIVE = 0
LEASH_COUNTER_THRESHOLD = 6
DEFAULT_FRUSTRATION_SEARCH_TIME = 0.05
DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME = 0.5
AGGRESSION_FIRST_SWEEP_RANGE = 400
LEASH_PROTECTION_BARRIER = 100
INNER_RANGE_BEFORE_CAMP_RELEASES = 700
OUTER_RANGE_BOUND = 250
ATTACKER_RANGE_BEFORE_RELEASH = 1150
CURRENT_TARGET_TO_ATTACKER_SWITCH_RANGE = 50
FEAR_WANDER_DISTANCE = 500
DoLuaShared("AIComponentSystem")
DoLuaShared("ObjectTags")
AddComponent("OutOfCombatRegen")
AddComponent("DefaultFearBehavior")
AddComponent("DefaultFleeBehavior")
AddComponent("DefaultTauntBehavior")
inStasis = false
function OnInit(A0_0)
  Event("ComponentInit")
  SetState(AI_ATTACK)
  SetCharVar("WillBeFrustrated", 0)
  OutOfCombatRegen:Start()
  SetMyLeashedPos()
  SetMyLeashedOrientation()
  InitTimer("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME, true)
  InitTimer("TimerAttack", 0.25, true)
  InitTimer("TimerReturningHome", 0.05, true)
  StopTimer("TimerFrustrationSearch")
  StopTimer("TimerReturningHome")
end
function OnOrder(A0_1, A1_2)
  if GetState() == AI_HALTED then
    return
  end
  if A0_1 == ORDER_ATTACKTO then
    AttackTarget(A1_2)
    return true
  end
  Error("Unsupported Order")
  return false
end
function LeashedCallForHelp(A0_3, A1_4)
  local L2_5, L3_6, L4_7, L5_8, L6_9
  L2_5 = GetState
  L2_5 = L2_5()
  L3_6 = AI_HALTED
  if L2_5 == L3_6 then
    return
  end
  L3_6 = GetTarget
  L3_6 = L3_6()
  L4_7 = RespondToAggression
  L5_8 = A1_4
  L4_7(L5_8)
  L4_7 = GetState
  L4_7 = L4_7()
  L5_8 = AI_RETREAT
  if L4_7 == L5_8 then
    L4_7 = GetLeashCounter
    L4_7 = L4_7()
    L5_8 = LEASH_COUNTER_THRESHOLD
    if L4_7 < L5_8 then
      L4_7 = GetMaxHP
      L4_7 = L4_7()
      L5_8 = GetHP
      L5_8 = L5_8()
      L6_9 = L5_8 / L4_7
      if L6_9 < 0.9 then
        return
      end
      L6_9 = GetCampLeashPos
      L6_9 = L6_9()
      if WalkDistanceBetweenObjectCenterAndPoint(A1_4, L6_9) <= GetCampLeashRadius() then
        AttackTarget(A1_4)
      elseif GetWalkDistToLeashedPos() <= INNER_RANGE_BEFORE_CAMP_RELEASES and WalkDistanceBetweenObjectCenterAndPoint(A1_4, L6_9) <= ATTACKER_RANGE_BEFORE_RELEASH then
        AttackTarget(A1_4)
      end
    end
  end
end
function OnTargetLost(A0_10, A1_11)
  local L2_12, L3_13
  L2_12 = TurnOffAutoAttack
  L3_13 = STOPREASON_MOVING
  L2_12(L3_13)
  L2_12 = GetState
  L2_12 = L2_12()
  L3_13 = AI_HALTED
  if L2_12 ~= L3_13 then
    L3_13 = AI_RETREAT
  elseif L2_12 == L3_13 then
    return
  end
  L3_13 = inStasis
  if L3_13 == true then
    return
  end
  L3_13 = GetOwner
  L3_13 = L3_13(A1_11)
  if L3_13 == nil then
    L3_13 = GetGoldRedirectTarget(A1_11)
  end
  if L3_13 ~= nil then
    AttackTarget(L3_13)
  else
    FindNewTarget()
  end
end
function TimerRetreat()
  SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
  FindNewTarget()
end
function AttackTarget(A0_14)
  if GetLeashCounter() > 0 then
    SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
    StartTimer("TimerFrustrationSearch")
  else
    SetTimerDelay("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME)
    ResetAndStartTimer("TimerFrustrationSearch")
  end
  SetGhosted(false)
  if A0_14 ~= nil then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, A0_14)
    SetRoamState(HOSTILE)
  end
end
function Retreat()
  StopTimer("TimerFrustrationSearch")
  StartTimer("TimerReturningHome")
  SetGhosted(true)
  SetStateAndMoveToLeashedPos(AI_RETREAT)
  TurnOffAutoAttack(STOPREASON_MOVING)
  OutOfCombatRegen:Start()
end
function IncreaseFrustration(A0_15)
  local L1_16
  L1_16 = GetLeashCounter
  L1_16 = L1_16()
  L1_16 = L1_16 + A0_15
  SetLeashCounter(L1_16)
  while A0_15 > 0 do
    AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustration", 1, LEASH_COUNTER_THRESHOLD + 1, 25000)
  end
  if L1_16 > LEASH_COUNTER_THRESHOLD then
    AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustration", 1, LEASH_COUNTER_THRESHOLD + 1, 25000)
    AIScriptSpellBuffRemove(GetThis(), "JungleFrustration")
    Retreat()
  else
    SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
    ResetTimer("TimerFrustrationSearch")
  end
end
function TargetWithinWalkBounds(A0_17, A1_18)
  local L2_19
  L2_19 = GetCampLeashPos
  L2_19 = L2_19()
  if A0_17 == nil then
    return false
  end
  if A1_18 < WalkDistanceBetweenObjectCenterAndPoint(A0_17, L2_19) then
    return false
  else
    return true
  end
end
function FindNearestAggressor(A0_20, A1_21)
  local L2_22, L3_23
  L2_22 = GetCampLeashRadius
  L2_22 = L2_22()
  L2_22 = L2_22 * 1.25
  L3_23 = FindTargetNearPosition
  L3_23 = L3_23(GetMyPos(), AGGRESSION_FIRST_SWEEP_RANGE)
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = FindTargetNearPosition(GetMyPos(), GetCampLeashRadius() + OUTER_RANGE_BOUND)
  end
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = FindTargetNearPosition(A0_20, GetCampLeashRadius() + OUTER_RANGE_BOUND)
    if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
      L3_23 = A1_21
    end
  end
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = FindTargetNearPosition(GetMyPos(), GetCampLeashRadius() + OUTER_RANGE_BOUND)
    return L3_23
  else
    return L3_23
  end
end
function RespondToAggression(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34
  L1_25 = GetMyPos
  L1_25 = L1_25()
  L2_26 = GetState
  L2_26 = L2_26()
  L3_27 = GetRoamState
  L3_27 = L3_27()
  L4_28 = INACTIVE
  if L3_27 == L4_28 then
    L3_27 = AI_RETREAT
    if L2_26 ~= L3_27 then
      L3_27 = AI_TAUNTED
      if L2_26 ~= L3_27 then
        L3_27 = AI_FEARED
        if L2_26 ~= L3_27 then
          L3_27 = AI_FLEEING
          if L2_26 ~= L3_27 then
            L3_27 = GetMaxHP
            L3_27 = L3_27()
            L4_28 = GetHP
            L4_28 = L4_28()
            L5_29 = L4_28 / L3_27
            if L5_29 > 0.9 then
              L5_29 = AttackTarget
              L6_30 = A0_24
              L5_29(L6_30)
            end
          end
        end
      end
    end
  else
    L3_27 = GetRoamState
    L3_27 = L3_27()
    L4_28 = HOSTILE
    if L3_27 == L4_28 then
      L3_27 = AI_ATTACK
      if L2_26 == L3_27 then
        L3_27 = GetTarget
        L3_27 = L3_27()
        target = L3_27
        L3_27 = target
        if L3_27 ~= nil then
          L3_27 = target
          if L3_27 ~= A0_24 then
            L3_27 = GetMyPos
            L3_27 = L3_27()
            L4_28 = OutOfCombatRegen
            L5_29 = L4_28
            L4_28 = L4_28.Stop
            L4_28(L5_29)
            L4_28 = DistanceBetweenObjectCenterAndPoint
            L5_29 = target
            L6_30 = L3_27
            L4_28 = L4_28(L5_29, L6_30)
            L5_29 = GetCampLeashPos
            L5_29 = L5_29()
            L6_30 = WalkDistanceBetweenObjectCenterAndPoint
            L7_31 = target
            L8_32 = L5_29
            L6_30 = L6_30(L7_31, L8_32)
            L7_31 = GetCampLeashRadius
            L7_31 = L7_31()
            L8_32 = DistanceBetweenObjectCenterAndPoint
            L9_33 = A0_24
            L10_34 = L3_27
            L8_32 = L8_32(L9_33, L10_34)
            L9_33 = WalkDistanceBetweenObjectCenterAndPoint
            L10_34 = A0_24
            L9_33 = L9_33(L10_34, L5_29)
            L10_34 = GetCampLeashRadius
            L10_34 = L10_34()
            L10_34 = L10_34 * 1.25
            if L4_28 > L8_32 + CURRENT_TARGET_TO_ATTACKER_SWITCH_RANGE then
              if TargetWithinWalkBounds(A0_24, L10_34) then
                AttackTarget(A0_24)
                SetCharVar("WillBeFrustrated", 1.01)
              end
            elseif not TargetWithinWalkBounds(target, L10_34) then
              AttackTarget(A0_24)
              SetCharVar("WillBeFrustrated", 1.01)
            end
          end
        else
          L3_27 = target
          if L3_27 ~= nil then
            L3_27 = AI_ATTACK
            if L2_26 == L3_27 then
              L3_27 = AttackTarget
              L4_28 = A0_24
              L3_27(L4_28)
            end
          else
            L3_27 = AttackTarget
            L4_28 = A0_24
            L3_27(L4_28)
          end
        end
      end
    end
  end
end
function TimerFrustrationSearch()
  local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45
  L0_35 = GetState
  L0_35 = L0_35()
  L1_36 = GetRoamState
  L1_36 = L1_36()
  L2_37 = GetCharVar
  L3_38 = "WillBeFrustrated"
  L2_37 = L2_37(L3_38)
  L3_38 = INACTIVE
  if L1_36 ~= L3_38 then
    L3_38 = RUN_IN_FEAR
    if L1_36 ~= L3_38 then
      L3_38 = AI_HALTED
      if L0_35 ~= L3_38 then
        L3_38 = inStasis
      end
    end
  elseif L3_38 == true then
    return
  end
  L3_38 = SetTimerDelay
  L4_39 = "TimerFrustrationSearch"
  L5_40 = DEFAULT_FRUSTRATION_SEARCH_TIME
  L3_38(L4_39, L5_40)
  L3_38 = GetLeashCounter
  L3_38 = L3_38()
  L4_39 = false
  if L2_37 >= 1 then
    L4_39 = true
    L5_40 = SetCharVar
    L6_41 = "WillBeFrustrated"
    L7_42 = 0
    L5_40(L6_41, L7_42)
  end
  L5_40 = GetTarget
  L5_40 = L5_40()
  L6_41 = GetCampLeashRadius
  L6_41 = L6_41()
  L7_42 = GetMyLeashedPos
  L7_42 = L7_42()
  L8_43 = GetCampLeashPos
  L8_43 = L8_43()
  L9_44 = GetDistToLeashedPos
  L9_44 = L9_44()
  L10_45 = L6_41 + 1
  if L5_40 ~= nil then
    L10_45 = WalkDistanceBetweenObjectCenterAndPoint(L5_40, L8_43)
  else
    FindNewTarget()
    L5_40 = GetTarget()
    if L5_40 == nil then
      L4_39 = true
    end
  end
  if L9_44 > L6_41 - LEASH_PROTECTION_BARRIER and L6_41 > L9_44 and L6_41 < L10_45 and L0_35 ~= AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    FindNewTarget()
    L5_40 = GetTarget()
    if L5_40 ~= nil and L5_40 ~= L5_40 then
      L4_39 = true
    end
  end
  if L10_45 > L6_41 + OUTER_RANGE_BOUND and L0_35 ~= AI_RETREAT and L9_44 > LEASH_PROTECTION_BARRIER * 2 then
    L4_39 = true
  end
  if L9_44 > L6_41 + OUTER_RANGE_BOUND then
    L4_39 = true
  end
  if L4_39 == true then
    IncreaseFrustration(1)
  end
end
function TimerReturningHome()
  if GetRoamState() == INACTIVE or GetRoamState() == RUN_IN_FEAR or GetState() == AI_HALTED or inStasis == true then
    return
  end
  if GetState() == AI_RETREAT and IsMovementStopped() == true and GetDistToRetreat() < 25 then
    StopTimer("TimerReturningHome")
    SetLeashOrientation()
    AIScriptSpellBuffRemove(GetThis(), "JungleFrustration")
    SetLeashCounter(0)
    AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustrationReset", 1, 1, 0.25)
    SetGhosted(false)
    SetState(AI_ATTACK)
    SetRoamState(GetOriginalState())
    SetTimerDelay("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME)
  elseif GetDistToRetreat() >= 25 then
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
end
function TimerAttack()
  local L0_46, L1_47
  L0_46 = GetState
  L0_46 = L0_46()
  L1_47 = AI_HALTED
  if L0_46 == L1_47 then
    return
  end
  L1_47 = inStasis
  if L1_47 == true then
    return
  end
  L1_47 = GetRoamState
  L1_47 = L1_47()
  if L1_47 ~= INACTIVE then
    L1_47 = GetRoamState
    L1_47 = L1_47()
    if L1_47 ~= RUN_IN_FEAR then
      L1_47 = AI_RETREAT
    end
  elseif L0_46 == L1_47 then
    return
  end
  L1_47 = AI_ATTACK
  if L0_46 ~= L1_47 then
    L1_47 = AI_TAUNTED
  elseif L0_46 == L1_47 then
    L1_47 = GetTarget
    L1_47 = L1_47()
    if L1_47 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_47)
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
    else
      FindNewTarget()
    end
  end
end
function FindNewTarget()
  local L0_48, L1_49, L2_50, L3_51, L4_52
  L0_48 = GetState
  L0_48 = L0_48()
  L1_49 = AI_HALTED
  if L0_48 == L1_49 then
    return
  end
  L1_49 = GetRoamState
  L1_49 = L1_49()
  L2_50 = INACTIVE
  if L1_49 ~= L2_50 then
    L1_49 = GetRoamState
    L1_49 = L1_49()
    L2_50 = RUN_IN_FEAR
    if L1_49 ~= L2_50 then
      L1_49 = GetState
      L1_49 = L1_49()
      L2_50 = AI_RETREAT
    end
  elseif L1_49 == L2_50 then
    L1_49 = TurnOffAutoAttack
    L2_50 = STOPREASON_MOVING
    L1_49(L2_50)
    return
  end
  L1_49 = GetCampLeashRadius
  L1_49 = L1_49()
  L2_50 = GetCampLeashPos
  L2_50 = L2_50()
  L3_51 = GetTarget
  L3_51 = L3_51()
  L4_52 = nil
  if L3_51 ~= nil then
    L4_52 = FindNearestAggressor(L2_50, L3_51)
  else
    L4_52 = FindNearestAggressor(L2_50, nil)
  end
  if L4_52 ~= nil then
    AttackTarget(L4_52)
  end
end
function HaltAI()
  Event("ComponentHalt")
  StopTimer("TimerFrustrationSearch")
  StopTimer("TimerAttack")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
function StopLeashing()
  OutOfCombatRegen:Stop()
  StopTimer("TimerFrustrationSearch")
  StopTimer("TimerAttack")
end
function StartLeashing()
  ResetAndStartTimer("TimerFrustrationSearch")
  ResetAndStartTimer("TimerAttack")
end
function EnterStasis()
  local L1_53
  L1_53 = true
  inStasis = L1_53
end
function ExitStasis()
  inStasis = false
  FindNewTarget()
end
