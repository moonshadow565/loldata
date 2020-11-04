RUN_IN_FEAR = 2
HOSTILE = 1
INACTIVE = 0
LEASH_COUNTER_THRESHOLD = 6
DEFAULT_FRUSTRATION_SEARCH_TIME = 0.05
DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME = 0.6
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
function OnInit(A0_0)
  Event("ComponentInit")
  SetState(AI_ATTACK)
  SetCharVar("WillBeFrustrated", 0)
  SetCharVar("inStasis", 0)
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
      else
        L6_9 = OutOfCombatRegen
        L6_9 = L6_9.Start
        L6_9(L6_9)
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
  L3_13 = GetCharVar
  L3_13 = L3_13("inStasis")
  if L3_13 > 1 then
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
  StartTimer("TimerFrustrationSearch")
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
  L3_23 = FindTargetWithFilter
  L3_23 = L3_23(AGGRESSION_FIRST_SWEEP_RANGE, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane)
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane)
  end
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = FindTargetNearPosition(A0_20, GetCampLeashRadius())
    if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
      L3_23 = A1_21
    end
  end
  if L3_23 == nil or not TargetWithinWalkBounds(L3_23, L2_22) then
    L3_23 = nil
    L3_23 = FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane)
    return L3_23
  else
    return L3_23
  end
end
function OnTakeDamage(A0_24)
  local L1_25
  L1_25 = GetState
  L1_25 = L1_25()
  PrintToChat("-- OnTakeDamage -- aiState" .. L1_25)
end
function RespondToAggression(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36
  L1_27 = GetMyPos
  L1_27 = L1_27()
  L2_28 = GetState
  L2_28 = L2_28()
  L3_29 = GetRoamState
  L3_29 = L3_29()
  L4_30 = INACTIVE
  if L3_29 == L4_30 then
    L3_29 = AI_RETREAT
    if L2_28 ~= L3_29 then
      L3_29 = AI_TAUNTED
      if L2_28 ~= L3_29 then
        L3_29 = AI_FEARED
        if L2_28 ~= L3_29 then
          L3_29 = AI_FLEEING
          if L2_28 ~= L3_29 then
            L3_29 = GetMaxHP
            L3_29 = L3_29()
            L4_30 = GetHP
            L4_30 = L4_30()
            L5_31 = L4_30 / L3_29
            if L5_31 > 0.9 then
              L5_31 = IsValidEnemy
              L6_32 = A0_26
              L5_31 = L5_31(L6_32)
              if L5_31 then
                L5_31 = AttackTarget
                L6_32 = A0_26
                L5_31(L6_32)
              end
            else
              L5_31 = OutOfCombatRegen
              L6_32 = L5_31
              L5_31 = L5_31.Start
              L5_31(L6_32)
            end
          end
        end
      end
    end
  else
    L3_29 = GetRoamState
    L3_29 = L3_29()
    L4_30 = HOSTILE
    if L3_29 == L4_30 then
      L3_29 = AI_ATTACK
      if L2_28 == L3_29 then
        L3_29 = IsValidEnemy
        L4_30 = A0_26
        L3_29 = L3_29(L4_30)
        if L3_29 then
          L3_29 = GetTarget
          L3_29 = L3_29()
          target = L3_29
          L3_29 = target
          if L3_29 ~= nil then
            L3_29 = target
            if L3_29 ~= A0_26 then
              L3_29 = GetMyPos
              L3_29 = L3_29()
              L4_30 = OutOfCombatRegen
              L5_31 = L4_30
              L4_30 = L4_30.Stop
              L4_30(L5_31)
              L4_30 = DistanceBetweenObjectCenterAndPoint
              L5_31 = target
              L6_32 = L3_29
              L4_30 = L4_30(L5_31, L6_32)
              L5_31 = GetCampLeashPos
              L5_31 = L5_31()
              L6_32 = WalkDistanceBetweenObjectCenterAndPoint
              L7_33 = target
              L8_34 = L5_31
              L6_32 = L6_32(L7_33, L8_34)
              L7_33 = GetCampLeashRadius
              L7_33 = L7_33()
              L8_34 = DistanceBetweenObjectCenterAndPoint
              L9_35 = A0_26
              L10_36 = L3_29
              L8_34 = L8_34(L9_35, L10_36)
              L9_35 = WalkDistanceBetweenObjectCenterAndPoint
              L10_36 = A0_26
              L9_35 = L9_35(L10_36, L5_31)
              L10_36 = GetCampLeashRadius
              L10_36 = L10_36()
              L10_36 = L10_36 * 1.25
              if L4_30 > L8_34 + CURRENT_TARGET_TO_ATTACKER_SWITCH_RANGE then
                if TargetWithinWalkBounds(A0_26, L10_36) then
                  AttackTarget(A0_26)
                  SetCharVar("WillBeFrustrated", 1.01)
                end
              elseif not TargetWithinWalkBounds(target, L10_36) then
                AttackTarget(A0_26)
                SetCharVar("WillBeFrustrated", 1.01)
              end
            end
          else
            L3_29 = target
            if L3_29 ~= nil then
              L3_29 = AI_ATTACK
              if L2_28 == L3_29 then
                L3_29 = IsValidEnemy
                L4_30 = A0_26
                L3_29 = L3_29(L4_30)
                if L3_29 then
                  L3_29 = AttackTarget
                  L4_30 = A0_26
                  L3_29(L4_30)
                end
              end
            else
              L3_29 = IsValidEnemy
              L4_30 = A0_26
              L3_29 = L3_29(L4_30)
              if L3_29 then
                L3_29 = AttackTarget
                L4_30 = A0_26
                L3_29(L4_30)
              end
            end
          end
        end
      end
    end
  end
end
function TimerFrustrationSearch()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47
  L0_37 = GetState
  L0_37 = L0_37()
  L1_38 = GetRoamState
  L1_38 = L1_38()
  L2_39 = GetCharVar
  L3_40 = "WillBeFrustrated"
  L2_39 = L2_39(L3_40)
  L3_40 = INACTIVE
  if L1_38 ~= L3_40 then
    L3_40 = RUN_IN_FEAR
    if L1_38 ~= L3_40 then
      L3_40 = AI_HALTED
      if L0_37 ~= L3_40 then
        L3_40 = GetCharVar
        L4_41 = "inStasis"
        L3_40 = L3_40(L4_41)
      end
    end
  elseif L3_40 > 1 then
    return
  end
  L3_40 = SetTimerDelay
  L4_41 = "TimerFrustrationSearch"
  L5_42 = DEFAULT_FRUSTRATION_SEARCH_TIME
  L3_40(L4_41, L5_42)
  L3_40 = GetLeashCounter
  L3_40 = L3_40()
  L4_41 = false
  if L2_39 >= 1 then
    L4_41 = true
    L5_42 = SetCharVar
    L6_43 = "WillBeFrustrated"
    L7_44 = 0
    L5_42(L6_43, L7_44)
  end
  L5_42 = GetTarget
  L5_42 = L5_42()
  L6_43 = GetCampLeashRadius
  L6_43 = L6_43()
  L7_44 = GetMyLeashedPos
  L7_44 = L7_44()
  L8_45 = GetCampLeashPos
  L8_45 = L8_45()
  L9_46 = GetDistToLeashedPos
  L9_46 = L9_46()
  L10_47 = L6_43 + 1
  if L5_42 ~= nil then
    L10_47 = WalkDistanceBetweenObjectCenterAndPoint(L5_42, L8_45)
  else
    FindNewTarget()
    L5_42 = GetTarget()
    if L5_42 == nil then
      L4_41 = true
    end
  end
  if L9_46 > L6_43 - LEASH_PROTECTION_BARRIER and L6_43 > L9_46 and L6_43 < L10_47 and L0_37 ~= AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    FindNewTarget()
    L5_42 = GetTarget()
    if L5_42 ~= nil and L5_42 ~= L5_42 then
      L4_41 = true
    end
  end
  if L10_47 > L6_43 + OUTER_RANGE_BOUND and L0_37 ~= AI_RETREAT then
    L4_41 = true
  end
  if L9_46 > L6_43 + OUTER_RANGE_BOUND then
    L4_41 = true
  end
  if L4_41 == true then
    IncreaseFrustration(1)
  end
end
function TimerReturningHome()
  if GetRoamState() == INACTIVE or GetRoamState() == RUN_IN_FEAR or GetState() == AI_HALTED or GetCharVar("inStasis") > 1 then
    return
  end
  if GetState() == AI_RETREAT and IsMovementStopped() == true and GetDistToRetreat() < 25 then
    if GetHP() / GetMaxHP() > 0.9 then
      StopTimer("TimerReturningHome")
      SetLeashOrientation()
      AIScriptSpellBuffRemove(GetThis(), "JungleFrustration")
      SetLeashCounter(0)
      AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustrationReset", 0, 1, 25000)
      SetGhosted(false)
      SetState(AI_ATTACK)
      SetRoamState(GetOriginalState())
      SetTimerDelay("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME)
    end
  elseif GetDistToRetreat() >= 25 then
    SetStateAndMoveToLeashedPos(AI_RETREAT)
  end
end
function TimerAttack()
  local L0_48, L1_49
  L0_48 = GetState
  L0_48 = L0_48()
  L1_49 = AI_HALTED
  if L0_48 == L1_49 then
    return
  end
  L1_49 = GetCharVar
  L1_49 = L1_49("inStasis")
  if L1_49 > 1 then
    return
  end
  L1_49 = GetRoamState
  L1_49 = L1_49()
  if L1_49 ~= INACTIVE then
    L1_49 = GetRoamState
    L1_49 = L1_49()
    if L1_49 ~= RUN_IN_FEAR then
      L1_49 = AI_RETREAT
    end
  elseif L0_48 == L1_49 then
    return
  end
  L1_49 = AI_ATTACK
  if L0_48 ~= L1_49 then
    L1_49 = AI_TAUNTED
  elseif L0_48 == L1_49 then
    L1_49 = StartTimer
    L1_49("TimerFrustrationSearch")
    L1_49 = GetTarget
    L1_49 = L1_49()
    if L1_49 ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack(L1_49)
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
      if IsMovementStopped() == true then
        AttackTarget(L1_49)
      end
    elseif L0_48 == AI_ATTACK then
      FindNewTarget()
      if L1_49 == nil then
        SetCharVar("WillBeFrustrated", 1.01)
      end
    end
  end
end
function FindNewTarget()
  local L0_50, L1_51, L2_52, L3_53, L4_54
  L0_50 = GetState
  L0_50 = L0_50()
  L1_51 = AI_HALTED
  if L0_50 == L1_51 then
    return
  end
  L1_51 = GetRoamState
  L1_51 = L1_51()
  L2_52 = INACTIVE
  if L1_51 ~= L2_52 then
    L1_51 = GetRoamState
    L1_51 = L1_51()
    L2_52 = RUN_IN_FEAR
    if L1_51 ~= L2_52 then
      L1_51 = GetState
      L1_51 = L1_51()
      L2_52 = AI_RETREAT
    end
  elseif L1_51 == L2_52 then
    L1_51 = TurnOffAutoAttack
    L2_52 = STOPREASON_MOVING
    L1_51(L2_52)
    return
  end
  L1_51 = GetCampLeashRadius
  L1_51 = L1_51()
  L2_52 = GetCampLeashPos
  L2_52 = L2_52()
  L3_53 = GetTarget
  L3_53 = L3_53()
  L4_54 = nil
  if L3_53 ~= nil then
    L4_54 = FindNearestAggressor(L2_52, L3_53)
  else
    L4_54 = FindNearestAggressor(L2_52, nil)
  end
  if L4_54 ~= nil then
    AttackTarget(L4_54)
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
  StopTimer("TimerFrustrationSearch")
  StopTimer("TimerAttack")
end
function StartLeashing()
  if GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    ResetAndStartTimer("TimerFrustrationSearch")
    ResetAndStartTimer("TimerAttack")
  end
end
function TurnOffRegeneration()
  OutOfCombatRegen:Stop()
end
function TurnOnRegeneration()
  OutOfCombatRegen:Start()
end
function EnterStasis()
  SetCharVar("inStasis", 1.01)
end
function ExitStasis()
  SetCharVar("inStasis", 0)
end
