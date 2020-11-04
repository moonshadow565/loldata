local L0_0, L1_1
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
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
  InitTimer("TimerCheckAttack", 4, true)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerFeared")
  return false
end
OnInit = L0_0
function L0_0(A0_2, A1_3)
  aiState = GetState()
  if aiState == AI_TAUNTED or aiState == AI_FEARED or aiState == AI_CHARMED then
    return
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
  aiState = GetState()
  if AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION ~= aiState then
    if A0_4 == LOST_VISIBILITY and aiState ~= AI_SOFTATTACK and A1_5 ~= nil then
      SetStateAndCloseToTarget(AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION, A1_5)
    else
      TimerCheckAttack()
    end
  end
end
OnTargetLost = L0_0
function L0_0()
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    SetStateAndCloseToTarget(AI_TAUNTED, tauntTarget)
  end
end
OnTauntBegin = L0_0
function L0_0()
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
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  TurnOffAutoAttack(STOPREASON_MOVING)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  StopTimer("TimerFeared")
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnFearEnd = L0_0
function L0_0()
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
TimerFeared = L0_0
function L0_0()
  NetSetState(AI_CHARMED)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  TimerCheckAttack()
end
OnCharmBegin = L0_0
function L0_0()
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnCharmEnd = L0_0
function L0_0()
  ClearTargetPosInPos()
end
OnStopMove = L0_0
function L0_0()
  aiState = GetState()
  if aiState == AI_SOFTATTACK or aiState == AI_HARDATTACK or aiState == AI_TAUNTED or aiState == AI_CHARMED then
    if IsTargetLost() == true or GetTarget() == nil then
      if LastAutoAttackFinished() == false then
        InitTimer("TimerCheckAttack", 0.05, true)
        return false
      end
      newTarget = FindTargetInAcR()
      if newTarget ~= nil then
        if aiState == AI_CHARMED then
          SetStateAndCloseToTarget(AI_CHARMED, newTarget)
        elseif CanSeeMe(newTarget) then
          SetStateAndCloseToTarget(AI_SOFTATTACK, newTarget)
        end
        return true
      else
        if aiState == AI_CHARMED then
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
  InitTimer("TimerCheckAttack", 0.05, true)
end
TimerCheckAttack = L0_0
function L0_0()
  local L0_6
  L0_6 = GetState
  L0_6 = L0_6()
  aiState = L0_6
  L0_6 = aiState
  if L0_6 ~= AI_STANDING then
    L0_6 = aiState
  elseif L0_6 == AI_IDLE then
    L0_6 = GetTargetOrFindTargetInAcR
    L0_6 = L0_6()
    if L0_6 ~= nil and CanSeeMe(L0_6) then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L0_6)
      return true
    end
  end
  L0_6 = aiState
  if L0_6 == AI_MOVE then
    L0_6 = IsMovementStopped
    L0_6 = L0_6()
    if L0_6 then
      L0_6 = GetTargetOrFindTargetInAcR
      L0_6 = L0_6()
      if L0_6 ~= nil and CanSeeMe(L0_6) then
        SetStateAndCloseToTarget(AI_SOFTATTACK, L0_6)
        TurnOnAutoAttack(L0_6)
        return true
      end
      NetSetState(AI_IDLE)
      return false
    end
  end
  L0_6 = aiState
  if L0_6 == AI_ATTACKMOVESTATE then
    L0_6 = GetTargetOrFindTargetInAcR
    L0_6 = L0_6()
    if L0_6 ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L0_6)
      return true
    elseif DistanceBetweenObjectAndTargetPos(me) <= 10 then
      NetSetState(AI_STANDING)
      ClearTargetPosInPos()
      return true
    end
  end
  L0_6 = aiState
  if L0_6 == AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION then
    L0_6 = GetLostTargetIfVisible
    L0_6 = L0_6()
    if L0_6 ~= nil then
      SetStateAndCloseToTarget(AI_HARDATTACK, L0_6)
    end
  end
end
TimerDistanceScan = L0_0
function L0_0(A0_7, A1_8)
  Say(A0_7)
end
OnAICommand = L0_0
function L0_0()
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnReachedDestinationForGoingToLastLocation = L0_0
