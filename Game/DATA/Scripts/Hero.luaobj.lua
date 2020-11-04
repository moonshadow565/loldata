FEAR_WANDER_DISTANCE = 500
FLEE_RUN_DISTANCE = 2000
STATE_STRINGS = {
  [0] = "AI_IDLE",
  "AI_SOFTATTACK",
  "AI_HARDATTACK",
  "AI_ATTACKMOVESTATE",
  "AI_STANDING",
  "AI_MOVE",
  "AI_GUARD",
  "AI_ATTACK",
  "AI_RETREAT",
  "AI_HARDIDLE",
  "AI_HARDIDLE_ATTACKING",
  "AI_TAUNTED",
  "AI_ATTACKMOVE_ATTACKING",
  "AI_FEARED",
  "AI_CHARMED",
  "AI_FLEEING",
  "AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION",
  "AI_HALTED",
  "AI_SIEGEATTACK"
}
function CalculateAttackTimer()
  checkAttackTimer = 1.6 / (GetPercentAttackSpeedMod() + 1)
  if checkAttackTimer < 0.5 then
    checkAttackTimer = 0.5
  end
  return checkAttackTimer
end
function OnInit()
  ClearTargetPosInPos()
  SetState(AI_IDLE)
  InitTimer("TimerDistanceScan", 0.2, true)
  InitTimer("TimerCheckAttack", 0.2, true)
  InitTimer("TimerFeared", 1, true)
  InitTimer("TimerFlee", 0.5, true)
  StopTimer("TimerFeared")
  StopTimer("TimerFlee")
  return false
end
function OnOrder(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = GetState
  L3_3 = L3_3()
  L4_4 = AI_HALTED
  if L3_3 == L4_4 then
    L4_4 = false
    return L4_4
  end
  L4_4 = AI_TAUNTED
  if L3_3 ~= L4_4 then
    L4_4 = AI_FEARED
    if L3_3 ~= L4_4 then
      L4_4 = AI_FLEEING
      if L3_3 ~= L4_4 then
        L4_4 = AI_CHARMED
      end
    end
  elseif L3_3 == L4_4 then
    L4_4 = false
    return L4_4
  end
  L4_4 = ORDER_TAUNT
  if A0_0 == L4_4 then
    L4_4 = SetStateAndCloseToTarget
    L4_4(AI_HARDATTACK, A1_1)
    L4_4 = ClearTargetPosInPos
    L4_4()
    L4_4 = true
    return L4_4
  end
  L4_4 = ORDER_ATTACKTO
  if A0_0 == L4_4 then
    L4_4 = SetStateAndCloseToTarget
    L4_4(AI_HARDATTACK, A1_1)
    L4_4 = AssignTargetPosInPos
    L4_4()
    L4_4 = TargetInAttackRange
    L4_4 = L4_4()
    if L4_4 == true then
      L4_4 = TurnOnAutoAttack
      L4_4(GetTarget())
    else
      L4_4 = TurnOffAutoAttack
      L4_4(STOPREASON_MOVING)
    end
    L4_4 = true
    return L4_4
  end
  L4_4 = ORDER_ATTACKTERRAIN_SUSTAINED
  if A0_0 ~= L4_4 then
    L4_4 = ORDER_ATTACKTERRAIN_ONCE
  elseif A0_0 == L4_4 then
    L4_4 = ORDER_ATTACKTERRAIN_SUSTAINED
    if A0_0 == L4_4 then
    else
      L4_4 = ORDER_ATTACKTERRAIN_ONCE
      if A0_0 == L4_4 then
      end
    end
    L4_4 = TargetPositionInAttackRange
    L4_4 = L4_4(A2_2)
    if L4_4 then
      L4_4 = ORDER_ATTACKTERRAIN_ONCE
      L4_4 = A0_0 == L4_4
      TurnOnAutoAttackTerrain(A2_2, L4_4)
    else
      L4_4 = TargetPositionInAttackRange
      L4_4 = L4_4(A2_2)
      if not L4_4 then
        L4_4 = SetStateAndMove
        L4_4(AI_HARDATTACK, A2_2)
        L4_4 = AssignTargetPosInPos
        L4_4()
        L4_4 = TurnOffAutoAttack
        L4_4(STOPREASON_MOVING)
      end
    end
    L4_4 = true
    return L4_4
  end
  L4_4 = ORDER_ATTACKMOVE
  if A0_0 == L4_4 then
    L4_4 = FindTargetInAcR
    L4_4 = L4_4()
    newTarget = L4_4
    L4_4 = newTarget
    if L4_4 ~= nil then
      L4_4 = SetStateAndCloseToTarget
      L4_4(AI_SOFTATTACK, newTarget)
      L4_4 = true
      return L4_4
    end
    L4_4 = SetStateAndMoveInPos
    L4_4(AI_ATTACKMOVESTATE)
    L4_4 = AssignTargetPosInPos
    L4_4()
    L4_4 = true
    return L4_4
  end
  L4_4 = ORDER_MOVETO
  if A0_0 == L4_4 then
    L4_4 = SetStateAndMoveInPos
    L4_4(AI_MOVE)
    L4_4 = AssignTargetPosInPos
    L4_4()
    L4_4 = true
    return L4_4
  end
  L4_4 = TimerCheckAttack
  L4_4()
  L4_4 = false
  return L4_4
end
function OnTargetLost(A0_5, A1_6)
  if GetState() == AI_HALTED then
    return
  end
  if AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION ~= GetState() then
    if A0_5 == LOST_VISIBILITY and GetState() ~= AI_SOFTATTACK and A1_6 ~= nil then
      SetStateAndCloseToTarget(AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION, A1_6)
    else
      TimerCheckAttack()
    end
  end
end
function OnTauntBegin()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
  end
end
function OnTauntEnd()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_SOFTATTACK, tauntTarget)
  else
    NetSetState(AI_IDLE)
    TimerDistanceScan()
    TimerCheckAttack()
  end
end
function OnFearBegin()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  TurnOffAutoAttack(STOPREASON_MOVING)
  ResetAndStartTimer("TimerFeared")
end
function OnFearEnd()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFeared")
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
function TimerFeared()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
function OnFleeBegin()
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetStateAndMove(AI_FLEEING, fleePoint)
  TurnOffAutoAttack(STOPREASON_MOVING)
  ResetAndStartTimer("TimerFlee")
end
function OnFleeEnd()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFlee")
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
function TimerFlee()
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetStateAndMove(AI_FLEEING, fleePoint)
end
function OnCharmBegin()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_CHARMED)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  TimerCheckAttack()
end
function OnCharmEnd()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
function OnStopMove()
  if GetState() == AI_HALTED then
    return
  end
  ClearTargetPosInPos()
end
function TimerCheckAttack()
  if GetState() ~= _UPVALUE0_ then
    _UPVALUE0_ = GetState()
  end
  if GetState() == AI_HALTED then
    return
  end
  if IsLocationAutoAttacker() and (GetOrder() == ORDER_ATTACKTERRAIN_ONCE or GetOrder() == ORDER_ATTACKTERRAIN_SUSTAINED) then
    if IsMoving() and TargetPositionInAttackRange((GetOrderPosition())) then
      TurnOnAutoAttackTerrain(GetOrderPosition(), GetOrder() == ORDER_ATTACKTERRAIN_ONCE)
      return
    elseif not TargetPositionInAttackRange((GetOrderPosition())) then
      SetStateAndMove(AI_HARDATTACK, (GetOrderPosition()))
      AssignTargetPosInPos()
      TurnOffAutoAttack(STOPREASON_MOVING)
      return
    end
  elseif GetState() == AI_SOFTATTACK or GetState() == AI_HARDATTACK or GetState() == AI_TAUNTED or GetState() == AI_CHARMED then
    if IsTargetLost() == true or GetTarget() == nil then
      if LastAutoAttackFinished() == false then
        InitTimer("TimerCheckAttack", 0.1, true)
        return
      end
      if IsAutoAcquireTargetEnabled() == false and GetState() ~= AI_SOFTATTACK then
        return
      end
      newTarget = FindTargetInAcR()
      if newTarget ~= nil then
        if GetState() == AI_CHARMED then
          SetStateAndCloseToTarget(AI_CHARMED, newTarget)
        elseif CanSeeMe(newTarget) then
          SetStateAndCloseToTarget(AI_SOFTATTACK, newTarget)
        end
        return true
      else
        if GetState() == AI_CHARMED then
          SpellBuffRemoveType(me, BUFF_Taunt)
        end
        NetSetState(AI_STANDING)
        return
      end
      return
    end
    if TargetInAttackRange() == true then
      TurnOnAutoAttack(GetTarget())
      return
    end
    if TargetInCancelAttackRange() == false then
      TurnOffAutoAttack(STOPREASON_MOVING)
    end
  elseif IsMoving() then
    return false
  end
  InitTimer("TimerCheckAttack", 0.1, true)
end
function TimerDistanceScan()
  if GetState() == AI_HALTED or GetState() == AI_HARDIDLE then
    return
  end
  if (GetState() == AI_STANDING or GetState() == AI_IDLE) and IsAutoAcquireTargetEnabled() and GetTargetOrFindTargetInAcR() ~= nil and CanSeeMe((GetTargetOrFindTargetInAcR())) then
    SetStateAndCloseToTarget(AI_SOFTATTACK, (GetTargetOrFindTargetInAcR()))
    return true
  end
  if GetState() == AI_MOVE and IsMovementStopped() and IsAutoAcquireTargetEnabled() then
    if GetTargetOrFindTargetInAcR() ~= nil and CanSeeMe((GetTargetOrFindTargetInAcR())) then
      SetStateAndCloseToTarget(AI_SOFTATTACK, (GetTargetOrFindTargetInAcR()))
      TurnOnAutoAttack((GetTargetOrFindTargetInAcR()))
      return true
    end
    NetSetState(AI_IDLE)
    return false
  end
  if GetState() == AI_ATTACKMOVESTATE then
    if GetTargetOrFindTargetInAcR() ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, (GetTargetOrFindTargetInAcR()))
      return true
    elseif DistanceBetweenObjectAndTargetPosSq(me) <= 100 then
      NetSetState(AI_STANDING)
      ClearTargetPosInPos()
      return true
    end
  end
  if GetState() == AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION and GetLostTargetIfVisible() ~= nil then
    SetStateAndCloseToTarget(AI_HARDATTACK, (GetLostTargetIfVisible()))
  end
end
function OnAICommand(A0_7, A1_8)
  if GetState() == AI_HALTED then
    return
  end
end
function OnReachedDestinationForGoingToLastLocation()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
function HaltAI()
  StopTimer("TimerDistanceScan")
  StopTimer("TimerCheckAttack")
  StopTimer("TimerFeared")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
