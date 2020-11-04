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
CURRENT_TARGET_TO_ATTACKER_SWITCH_RANGE = 25
FEAR_WANDER_DISTANCE = 500
DoLuaShared("AIComponentSystem")
DoLuaShared("ObjectTags")
AddComponent("OutOfCombatRegen")
AddComponent("DefaultFearBehavior")
AddComponent("DefaultFleeBehavior")
AddComponent("DefaultTauntBehavior")
function OnInit(_ARG_0_)
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
function OnOrder(_ARG_0_, _ARG_1_)
  if GetState() == AI_HALTED then
    return
  end
  if _ARG_0_ == ORDER_ATTACKTO then
    AttackTarget(_ARG_1_)
    return true
  end
  Error("Unsupported Order")
  return false
end
function LeashedCallForHelp(_ARG_0_, _ARG_1_)
  if GetState() == AI_HALTED then
    return
  end
  RespondToAggression(_ARG_1_)
  if GetState() == AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    if GetHP() / GetMaxHP() < 0.9 then
      OutOfCombatRegen:Start()
      return
    end
    if WalkDistanceBetweenObjectCenterAndPoint(_ARG_1_, (GetCampLeashPos())) <= GetCampLeashRadius() then
      AttackTarget(_ARG_1_)
    elseif GetWalkDistToLeashedPos() <= INNER_RANGE_BEFORE_CAMP_RELEASES and WalkDistanceBetweenObjectCenterAndPoint(_ARG_1_, (GetCampLeashPos())) <= ATTACKER_RANGE_BEFORE_RELEASH then
      AttackTarget(_ARG_1_)
    end
  end
end
function OnTargetLost(_ARG_0_, _ARG_1_)
  TurnOffAutoAttack(STOPREASON_MOVING)
  if GetState() == AI_HALTED or GetState() == AI_RETREAT then
    return
  end
  if GetCharVar("inStasis") > 1 then
    return
  end
  if GetOwner(_ARG_1_) == nil then
  end
  if GetGoldRedirectTarget(_ARG_1_) ~= nil then
    AttackTarget((GetGoldRedirectTarget(_ARG_1_)))
  else
    FindNewTarget()
  end
end
function TimerRetreat()
  SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
  StartTimer("TimerFrustrationSearch")
  FindNewTarget()
end
function AttackTarget(_ARG_0_)
  if GetLeashCounter() > 0 then
    SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
    StartTimer("TimerFrustrationSearch")
  else
    SetTimerDelay("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME)
    ResetAndStartTimer("TimerFrustrationSearch")
  end
  SetGhosted(false)
  if _ARG_0_ ~= nil then
    OutOfCombatRegen:Stop()
    SetStateAndCloseToTarget(AI_ATTACK, _ARG_0_)
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
function IncreaseFrustration(_ARG_0_)
  SetLeashCounter(GetLeashCounter() + _ARG_0_)
  while _ARG_0_ > 0 do
    AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustration", 1, LEASH_COUNTER_THRESHOLD + 1, 25000)
  end
  if GetLeashCounter() + _ARG_0_ > LEASH_COUNTER_THRESHOLD then
    AIScriptSpellBuffStackingAdd(GetThis(), GetThis(), "JungleFrustration", 1, LEASH_COUNTER_THRESHOLD + 1, 25000)
    AIScriptSpellBuffRemove(GetThis(), "JungleFrustration")
    Retreat()
  else
    SetTimerDelay("TimerFrustrationSearch", DELAY_BETWEEN_FRUSTRATION_SEARCH_TIME)
    ResetTimer("TimerFrustrationSearch")
  end
end
function TargetWithinWalkBounds(_ARG_0_, _ARG_1_)
  if _ARG_0_ == nil then
    return false
  end
  if _ARG_1_ < WalkDistanceBetweenObjectCenterAndPoint(_ARG_0_, (GetCampLeashPos())) then
    return false
  else
    return true
  end
end
function FindNearestAggressor(_ARG_0_, _ARG_1_)
  if FindTargetWithFilter(AGGRESSION_FIRST_SWEEP_RANGE, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane) == nil or not TargetWithinWalkBounds(FindTargetWithFilter(AGGRESSION_FIRST_SWEEP_RANGE, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane), GetCampLeashRadius() * 1.25) then
  end
  if (FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane) ~= nil and TargetWithinWalkBounds(FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane), GetCampLeashRadius() * 1.25) or FindTargetNearPosition(_ARG_0_, GetCampLeashRadius()) ~= nil and TargetWithinWalkBounds(FindTargetNearPosition(_ARG_0_, GetCampLeashRadius()), GetCampLeashRadius() * 1.25) or _ARG_1_) == nil or not TargetWithinWalkBounds(FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane) ~= nil and TargetWithinWalkBounds(FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane), GetCampLeashRadius() * 1.25) or FindTargetNearPosition(_ARG_0_, GetCampLeashRadius()) ~= nil and TargetWithinWalkBounds(FindTargetNearPosition(_ARG_0_, GetCampLeashRadius()), GetCampLeashRadius() * 1.25) or _ARG_1_, GetCampLeashRadius() * 1.25) then
    return (FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane))
  else
    return (FindTargetWithFilter(GetCampLeashRadius() + OUTER_RANGE_BOUND, UnitTagFlags.Minion + UnitTagFlags.Champion, UnitTagFlags.Special_Void + UnitTagFlags.Minion_Lane))
  end
end
function OnTakeDamage(_ARG_0_)
  PrintToChat("-- OnTakeDamage -- aiState" .. GetState())
end
function RespondToAggression(_ARG_0_)
  if GetRoamState() == INACTIVE and GetState() ~= AI_RETREAT and GetState() ~= AI_TAUNTED and GetState() ~= AI_FEARED and GetState() ~= AI_FLEEING then
    if GetHP() / GetMaxHP() > 0.9 and IsValidEnemy(_ARG_0_) or GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
      AttackTarget(_ARG_0_)
    else
      OutOfCombatRegen:Start()
    end
  elseif GetRoamState() == HOSTILE and GetState() == AI_ATTACK and IsValidEnemy(_ARG_0_) then
    target = GetTarget()
    if target ~= nil and target ~= _ARG_0_ then
      OutOfCombatRegen:Stop()
      if DistanceBetweenObjectCenterAndPoint(target, (GetMyPos())) > DistanceBetweenObjectCenterAndPoint(_ARG_0_, (GetMyPos())) + CURRENT_TARGET_TO_ATTACKER_SWITCH_RANGE then
        if TargetWithinWalkBounds(_ARG_0_, GetCampLeashRadius() * 1.25) then
          AttackTarget(_ARG_0_)
          SetCharVar("WillBeFrustrated", 1.01)
        end
      elseif not TargetWithinWalkBounds(target, GetCampLeashRadius() * 1.25) then
        AttackTarget(_ARG_0_)
        SetCharVar("WillBeFrustrated", 1.01)
      end
    elseif target ~= nil and GetState() == AI_ATTACK and IsValidEnemy(_ARG_0_) then
      AttackTarget(_ARG_0_)
    elseif IsValidEnemy(_ARG_0_) then
      AttackTarget(_ARG_0_)
    end
  end
end
function TimerFrustrationSearch()
  if GetRoamState() == INACTIVE or GetRoamState() == RUN_IN_FEAR or GetState() == AI_HALTED or GetCharVar("inStasis") > 1 then
    return
  end
  SetTimerDelay("TimerFrustrationSearch", DEFAULT_FRUSTRATION_SEARCH_TIME)
  if GetCharVar("WillBeFrustrated") >= 1 then
    SetCharVar("WillBeFrustrated", 0)
  end
  if GetTarget() ~= nil then
  else
    FindNewTarget()
  end
  if GetDistToLeashedPos() > GetCampLeashRadius() - LEASH_PROTECTION_BARRIER and GetCampLeashRadius() > GetDistToLeashedPos() and GetCampLeashRadius() < WalkDistanceBetweenObjectCenterAndPoint(GetTarget(), (GetCampLeashPos())) and GetState() ~= AI_RETREAT and GetLeashCounter() < LEASH_COUNTER_THRESHOLD then
    FindNewTarget()
  end
  if true == true then
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
  if GetState() == AI_HALTED then
    return
  end
  if GetCharVar("inStasis") > 1 then
    return
  end
  if GetRoamState() == INACTIVE or GetRoamState() == RUN_IN_FEAR or GetState() == AI_RETREAT then
    return
  end
  if GetState() == AI_ATTACK or GetState() == AI_TAUNTED then
    StartTimer("TimerFrustrationSearch")
    if GetTarget() ~= nil then
      if TargetInAttackRange() then
        TurnOnAutoAttack((GetTarget()))
      elseif TargetInCancelAttackRange() == false then
        TurnOffAutoAttack(STOPREASON_MOVING)
      end
      if IsMovementStopped() == true then
        AttackTarget((GetTarget()))
      end
    elseif GetState() == AI_ATTACK then
      FindNewTarget()
      if GetTarget() == nil then
        SetCharVar("WillBeFrustrated", 1.01)
      end
    end
  end
end
function FindNewTarget()
  if GetState() == AI_HALTED then
    return
  end
  if GetRoamState() == INACTIVE or GetRoamState() == RUN_IN_FEAR or GetState() == AI_RETREAT then
    TurnOffAutoAttack(STOPREASON_MOVING)
    return
  end
  if GetTarget() ~= nil then
  else
  end
  if FindNearestAggressor(GetCampLeashPos(), nil) ~= nil then
    AttackTarget((FindNearestAggressor(GetCampLeashPos(), nil)))
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
