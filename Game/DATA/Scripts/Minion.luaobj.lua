MAX_ENGAGE_DISTANCE = 2500
FEAR_WANDER_DISTANCE = 500
DELAY_FIND_ENEMIES = 0.25
START_ASLEEP_TIME = 145
DoLuaShared("ObjectTags")
DoLuaShared("Minions")
hasWokenUpAcquisition = false
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
  local L0_0
  if GetTargetAcquisitionMode() ~= TARGET_ACQUISITION_MODE_DEFAULT then
    if GetTargetAcquisitionMode() == TARGET_ACQUISITION_MODE_ASLEEP then
      SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_DEFAULT)
      SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_ASLEEP)
      if FindTargetInWakeUpRange() ~= nil then
        hasWokenUpAcquisition = true
        SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_DISTRIBUTE_FIRE)
        L0_0 = FindTargetInFirstAcquisitionRange()
        SetTarget(L0_0)
      end
    elseif GetMissionTime() > START_ASLEEP_TIME then
      SetTargetAcquisitionMode(TARGET_ACQUISITION_MODE_DEFAULT)
      L0_0 = FindTargetInAcR()
    elseif GetTarget() == nil then
      L0_0 = FindTargetInAcR()
    end
  else
    L0_0 = FindTargetInAcR()
  end
  if L0_0 ~= nil and GetRegionTag(L0_0, GameplayArea) ~= AREA_Lane_Top and GetRegionTag(L0_0, GameplayArea) ~= AREA_Lane_Mid and GetRegionTag(L0_0, GameplayArea) ~= AREA_Lane_Bot and GetRegionTag(L0_0, GameplayArea) ~= AREA_Base and GetRegionTag(L0_0, GameplayArea) ~= AREA_Platform then
    SetTarget(L0_0)
    AddToIgnore(0.1)
    return LaneMinionFindTarget()
  end
  return L0_0
end
function TimerFindEnemies()
  local L0_1, L1_2, L2_3
  L0_1 = GetState
  L0_1 = L0_1()
  L1_2 = AI_HALTED
  if L0_1 == L1_2 then
    return
  end
  L1_2 = GetMyRegionTag
  L2_3 = GameplayArea
  L1_2 = L1_2(L2_3)
  L2_3 = AREA_Lane_Top
  if L1_2 ~= L2_3 then
    L2_3 = AREA_Lane_Mid
    if L1_2 ~= L2_3 then
      L2_3 = AREA_Lane_Bot
      if L1_2 ~= L2_3 then
        L2_3 = AREA_Base
        if L1_2 ~= L2_3 then
          L2_3 = AREA_Platform
          if L1_2 ~= L2_3 then
            L2_3 = GetTarget
            L2_3 = L2_3()
            if L2_3 ~= nil then
              L2_3 = AddToIgnore
              L2_3(0.6)
            end
            L2_3 = FindTargetOrMove
            L2_3()
            return
          end
        end
      end
    end
  end
  L2_3 = AI_ATTACKMOVESTATE
  if L0_1 == L2_3 then
    L2_3 = LaneMinionFindTarget
    L2_3 = L2_3()
    if L2_3 == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L2_3)
    ResetAndStartTimer("TimerAntiKite")
  else
    L2_3 = AI_TAUNTED
    if L0_1 == L2_3 then
      L2_3 = GetTauntTarget
      L2_3 = L2_3()
      if L2_3 ~= nil then
        L2_3 = SetStateAndCloseToTarget
        L2_3(AI_TAUNTED, GetTauntTarget())
      end
    end
  end
  L2_3 = AI_ATTACKMOVE_ATTACKING
  if L0_1 ~= L2_3 then
    L2_3 = AI_TAUNTED
  elseif L0_1 == L2_3 then
    L2_3 = GetTarget
    L2_3 = L2_3()
    if L2_3 ~= nil then
      L2_3 = DistanceBetweenMeAndObject
      L2_3 = L2_3(GetTarget())
    elseif L2_3 > MAX_ENGAGE_DISTANCE then
      L2_3 = FindTargetOrMove
      L2_3()
    end
    L2_3 = TargetInAttackRange
    L2_3 = L2_3()
    if L2_3 then
      L2_3 = AI_TAUNTED
      if L0_1 ~= L2_3 then
        L2_3 = ResetAndStartTimer
        L2_3("TimerAntiKite")
      end
      L2_3 = TurnOnAutoAttack
      L2_3(GetTarget())
    else
      L2_3 = TargetInCancelAttackRange
      L2_3 = L2_3()
      if L2_3 == false then
        L2_3 = TurnOffAutoAttack
        L2_3(STOPREASON_MOVING)
        L2_3 = 0
        LastAttackScan = L2_3
      end
    end
  end
end
function FindTargetOrMove()
  local L0_4, L1_5
  L0_4 = GetState
  L0_4 = L0_4()
  L1_5 = AI_HALTED
  if L0_4 == L1_5 then
    L1_5 = TurnOffAutoAttack
    L1_5(STOPREASON_MOVING)
    return
  end
  L1_5 = LaneMinionFindTarget
  L1_5 = L1_5()
  if L1_5 ~= nil then
    if LastAutoAttackFinished() == false then
      InitTimer("TimerFindEnemies", DELAY_FIND_ENEMIES, true)
      return
    end
    SetStateAndCloseToTarget(AI_ATTACKMOVE_ATTACKING, L1_5)
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
