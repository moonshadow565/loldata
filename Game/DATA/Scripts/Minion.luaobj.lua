MAX_ENGAGE_DISTANCE = 2500
FEAR_WANDER_DISTANCE = 500
DELAY_FIND_ENEMIES = 0.25
CENTER_LANE = 1
START_ASLEEP_TIME = 90
ASLEEP_TIME_DEFAULT_LANE = 125
ASLEEP_TIME_CENTER_LANE = 115
DoLuaShared("ObjectTags")
DoLuaShared("Minions")
function OnPostInit()
  if GetMissionTime() < START_ASLEEP_TIME then
    SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_ASLEEP)
  end
end
function OnTauntBegin()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
    StopTimer("TimerAntiKite")
  end
end
function OnTauntEnd()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, tauntTarget)
    ResetAndStartTimer("TimerAntiKite")
  else
    FindTargetOrMove()
  end
end
function LaneMinionFindTarget()
  local L0_0, L1_1, L2_2
  L1_1 = GetTargetAcquisitionMode
  L1_1 = L1_1()
  L2_2 = TARGET_ACQUISITION_MODE_DEFAULT
  if L1_1 ~= L2_2 then
    L2_2 = TARGET_ACQUISITION_MODE_ASLEEP
    if L1_1 == L2_2 then
      L2_2 = SetTargetAcquisitionMode
      L2_2(TARGET_ACQUISITION_MODE_DEFAULT)
      L2_2 = FindTargetInWakeUpRange
      L2_2 = L2_2()
      SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_ASLEEP)
      if L2_2 ~= nil then
        SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_DISTRIBUTE_FIRE)
        L0_0 = FindTargetInFirstAcquisitionRange()
      end
    else
      L2_2 = ASLEEP_TIME_DEFAULT_LANE
      if GetMinionLane() == CENTER_LANE then
        L2_2 = ASLEEP_TIME_CENTER_LANE
      end
      if L2_2 < GetMissionTime() or GetTarget() == nil or IsHeroAI(L0_0) then
        SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_DEFAULT)
        L0_0 = FindTargetInAcR()
      end
    end
  else
    L2_2 = FindTargetInAcR
    L2_2 = L2_2()
    L0_0 = L2_2
  end
  if L0_0 ~= nil then
    L2_2 = GetRegionTag
    L2_2 = L2_2(L0_0, GameplayArea)
    if IsNochaseRegionForMinions(L2_2) then
      SetTarget(L0_0)
      AddToIgnore(0.1)
      return LaneMinionFindTarget()
    end
    SetTarget(L0_0)
  end
  return L0_0
end
function IsNochaseRegionForMinions(A0_3)
  local L1_4
  L1_4 = AREA_Lane_Top
  if A0_3 ~= L1_4 then
    L1_4 = AREA_Lane_Mid
    if A0_3 ~= L1_4 then
      L1_4 = AREA_Lane_Bot
      if A0_3 ~= L1_4 then
        L1_4 = AREA_Base
        if A0_3 ~= L1_4 then
          L1_4 = AREA_Platform
          if A0_3 ~= L1_4 then
            L1_4 = true
            return L1_4
          end
        end
      end
    end
  end
  L1_4 = false
  return L1_4
end
function TimerFindEnemies()
  local L0_5, L1_6, L2_7
  L0_5 = GetState
  L0_5 = L0_5()
  L1_6 = AI_HALTED
  if L0_5 == L1_6 then
    return
  end
  L1_6 = GetMyRegionTag
  L2_7 = GameplayArea
  L1_6 = L1_6(L2_7)
  L2_7 = IsNochaseRegionForMinions
  L2_7 = L2_7(L1_6)
  if L2_7 then
    L2_7 = GetTarget
    L2_7 = L2_7()
    if L2_7 ~= nil then
      L2_7 = AddToIgnore
      L2_7(0.6)
    end
    L2_7 = FindTargetOrMove
    L2_7()
    return
  end
  L2_7 = AI_ATTACKMOVESTATE
  if L0_5 == L2_7 then
    L2_7 = LaneMinionFindTarget
    L2_7 = L2_7()
    if L2_7 == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L2_7)
    ResetAndStartTimer("TimerAntiKite")
  else
    L2_7 = AI_TAUNTED
    if L0_5 == L2_7 then
      L2_7 = GetTauntTarget
      L2_7 = L2_7()
      if L2_7 ~= nil then
        L2_7 = SetStateAndCloseToTarget
        L2_7(AI_TAUNTED, GetTauntTarget())
      end
    end
  end
  L2_7 = AI_ATTACKMOVE_ATTACKING
  if L0_5 ~= L2_7 then
    L2_7 = AI_TAUNTED
  elseif L0_5 == L2_7 then
    L2_7 = GetTarget
    L2_7 = L2_7()
    if L2_7 ~= nil then
      L2_7 = DistanceBetweenMeAndObject
      L2_7 = L2_7(GetTarget())
    elseif L2_7 > MAX_ENGAGE_DISTANCE then
      L2_7 = FindTargetOrMove
      L2_7()
    end
    L2_7 = TargetInAttackRange
    L2_7 = L2_7()
    if L2_7 then
      L2_7 = AI_TAUNTED
      if L0_5 ~= L2_7 then
        L2_7 = ResetAndStartTimer
        L2_7("TimerAntiKite")
      end
      L2_7 = TurnOnAutoAttack
      L2_7(GetTarget())
    else
      L2_7 = TargetInCancelAttackRange
      L2_7 = L2_7()
      if L2_7 == false then
        L2_7 = TurnOffAutoAttack
        L2_7(STOPREASON_MOVING)
        L2_7 = 0
        LastAttackScan = L2_7
      end
    end
  end
end
function FindTargetOrMove()
  local L0_8, L1_9
  L0_8 = GetState
  L0_8 = L0_8()
  L1_9 = AI_HALTED
  if L0_8 == L1_9 then
    L1_9 = TurnOffAutoAttack
    L1_9(STOPREASON_MOVING)
    return
  end
  L1_9 = LaneMinionFindTarget
  L1_9 = L1_9()
  if L1_9 ~= nil then
    if LastAutoAttackFinished() == false then
      InitTimer("TimerFindEnemies", DELAY_FIND_ENEMIES, true)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L1_9)
    ResetAndStartTimer("TimerAntiKite")
  else
    TurnOffAutoAttack(STOPREASON_MOVING)
    SetStateAndMoveToForwardNav(AI_ATTACKMOVESTATE)
    StopTimer("TimerAntiKite")
    LastAttackScan = 0
  end
end
function TimerMoveForward()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_IDLE then
    FindTargetOrMove()
  elseif GetState() == AI_ATTACKMOVESTATE then
    SetStateAndMoveToForwardNav(AI_ATTACKMOVESTATE)
    LastAttackScan = 0
  end
end
