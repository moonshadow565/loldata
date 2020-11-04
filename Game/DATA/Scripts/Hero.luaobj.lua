local L0_0, L1_1
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
L0_0 = 2000
FLEE_RUN_DISTANCE = L0_0
function L0_0()
  checkAttackTimer = 1.6 / (GetPercentAttackSpeedMod() + 1)
  if checkAttackTimer < 0.5 then
    checkAttackTimer = 0.5
  end
  return checkAttackTimer
end
CalculateAttackTimer = L0_0
function L0_0()
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
OnInit = L0_0
function L0_0(A0_2, A1_3)
  if GetState() == AI_HALTED then
    return false
  end
  if GetState() == AI_TAUNTED or GetState() == AI_FEARED or GetState() == AI_FLEEING or GetState() == AI_CHARMED then
    return false
  end
  if A0_2 == ORDER_TAUNT then
    SetStateAndCloseToTarget(AI_HARDATTACK, A1_3)
    ClearTargetPosInPos()
    return true
  end
  if A0_2 == ORDER_ATTACKTO then
    SetStateAndCloseToTarget(AI_HARDATTACK, A1_3)
    AssignTargetPosInPos()
    if TargetInAttackRange() == true then
      TurnOnAutoAttack(GetTarget())
    else
      TurnOffAutoAttack(STOPREASON_MOVING)
    end
    return true
  end
  if A0_2 == ORDER_ATTACKMOVE then
    newTarget = FindTargetInAcR()
    if newTarget ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, newTarget)
      return true
    end
    SetStateAndMoveInPos(AI_ATTACKMOVESTATE)
    AssignTargetPosInPos()
    return true
  end
  if A0_2 == ORDER_MOVETO then
    SetStateAndMoveInPos(AI_MOVE)
    AssignTargetPosInPos()
    return true
  end
  TimerCheckAttack()
  return false
end
OnOrder = L0_0
function L0_0(A0_4, A1_5)
  if GetState() == AI_HALTED then
    return
  end
  if AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION ~= GetState() then
    if A0_4 == LOST_VISIBILITY and GetState() ~= AI_SOFTATTACK and A1_5 ~= nil then
      SetStateAndCloseToTarget(AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION, A1_5)
    else
      TimerCheckAttack()
    end
  end
end
OnTargetLost = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
  end
end
OnTauntBegin = L0_0
function L0_0()
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
OnTauntEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  TurnOffAutoAttack(STOPREASON_MOVING)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFeared")
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
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
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetStateAndMove(AI_FLEEING, fleePoint)
  TurnOffAutoAttack(STOPREASON_MOVING)
  ResetAndStartTimer("TimerFlee")
end
OnFleeBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  StopTimer("TimerFlee")
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnFleeEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  fleePoint = MakeFleePoint()
  SetStateAndMove(AI_FLEEING, fleePoint)
end
TimerFlee = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_CHARMED)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  TimerCheckAttack()
end
OnCharmBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnCharmEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  ClearTargetPosInPos()
end
OnStopMove = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_SOFTATTACK or GetState() == AI_HARDATTACK or GetState() == AI_TAUNTED or GetState() == AI_CHARMED then
    if IsTargetLost() == true or GetTarget() == nil then
      if LastAutoAttackFinished() == false then
        InitTimer("TimerCheckAttack", 0.1, true)
        return false
      end
      if IsAutoAcquireTargetEnabled() == false and GetState() ~= AI_SOFTATTACK then
        return false
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
        return true
      end
      return true
    end
    if TargetInAttackRange() == true then
      TurnOnAutoAttack(GetTarget())
      return true
    end
    if TargetInCancelAttackRange() == false then
      TurnOffAutoAttack(STOPREASON_MOVING)
    end
  elseif IsMoving() then
    return false
  end
  InitTimer("TimerCheckAttack", 0.1, true)
end
TimerCheckAttack = L0_0
function L0_0()
  local L0_6, L1_7
  L0_6 = GetState
  L0_6 = L0_6()
  L1_7 = AI_HALTED
  if L0_6 ~= L1_7 then
    L1_7 = AI_HARDIDLE
  elseif L0_6 == L1_7 then
    return
  end
  L1_7 = AI_STANDING
  if L0_6 ~= L1_7 then
    L1_7 = AI_IDLE
  elseif L0_6 == L1_7 then
    L1_7 = IsAutoAcquireTargetEnabled
    L1_7 = L1_7()
    if L1_7 then
      L1_7 = GetTargetOrFindTargetInAcR
      L1_7 = L1_7()
      if L1_7 ~= nil and CanSeeMe(L1_7) then
        SetStateAndCloseToTarget(AI_SOFTATTACK, L1_7)
        return true
      end
    end
  end
  L1_7 = AI_MOVE
  if L0_6 == L1_7 then
    L1_7 = IsMovementStopped
    L1_7 = L1_7()
    if L1_7 then
      L1_7 = IsAutoAcquireTargetEnabled
      L1_7 = L1_7()
      if L1_7 then
        L1_7 = GetTargetOrFindTargetInAcR
        L1_7 = L1_7()
        if L1_7 ~= nil and CanSeeMe(L1_7) then
          SetStateAndCloseToTarget(AI_SOFTATTACK, L1_7)
          TurnOnAutoAttack(L1_7)
          return true
        end
        NetSetState(AI_IDLE)
        return false
      end
    end
  end
  L1_7 = AI_ATTACKMOVESTATE
  if L0_6 == L1_7 then
    L1_7 = GetTargetOrFindTargetInAcR
    L1_7 = L1_7()
    if L1_7 ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L1_7)
      return true
    elseif DistanceBetweenObjectAndTargetPosSq(me) <= 100 then
      NetSetState(AI_STANDING)
      ClearTargetPosInPos()
      return true
    end
  end
  L1_7 = AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION
  if L0_6 == L1_7 then
    L1_7 = GetLostTargetIfVisible
    L1_7 = L1_7()
    if L1_7 ~= nil then
      SetStateAndCloseToTarget(AI_HARDATTACK, L1_7)
    end
  end
end
TimerDistanceScan = L0_0
function L0_0(A0_8, A1_9)
  if GetState() == AI_HALTED then
    return
  end
  Say(A0_8)
end
OnAICommand = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnReachedDestinationForGoingToLastLocation = L0_0
function L0_0()
  StopTimer("TimerDistanceScan")
  StopTimer("TimerCheckAttack")
  StopTimer("TimerFeared")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
