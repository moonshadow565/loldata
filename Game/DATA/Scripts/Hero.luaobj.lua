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
  targetPos = Make3DPoint(-1, -1, -1)
  SetState(AI_IDLE)
  InitTimer("TimerDistanceScan", 0.2, true)
  InitTimer("TimerCheckAttack", 4, true)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerFeared")
  return false
end
OnInit = L0_0
function L0_0(A0_2, A1_3, A2_4)
  aiState = GetState()
  if aiState == AI_TAUNTED or aiState == AI_FEARED or aiState == AI_CHARMED then
    return
  end
  if A0_2 == ORDER_TAUNT then
    SetStateAndCloseToTarget(AI_HARDATTACK, A2_4)
    targetPos = Make3DPoint(-1, -1, -1)
    return true
  end
  if A0_2 == ORDER_ATTACKTO then
    SetStateAndCloseToTarget(AI_HARDATTACK, A2_4)
    targetPos = Make3DPoint(-1, -1, -1)
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
    SetStateAndMove(AI_ATTACKMOVESTATE, A1_3)
    targetPos = A1_3
    return true
  end
  if A0_2 == ORDER_MOVETO then
    SetStateAndMove(AI_MOVE, A1_3)
    targetPos = A1_3
    return true
  end
  TimerCheckAttack()
  return false
end
OnOrder = L0_0
function L0_0(A0_5, A1_6)
  aiState = GetState()
  if AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION ~= aiState then
    if A0_5 == LOST_VISIBILITY and aiState ~= AI_SOFTATTACK and A1_6 ~= nil then
      SetStateAndCloseToTarget(AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION, A1_6)
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
  targetPos = Make3DPoint(-1, -1, -1)
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
        else
          SetStateAndCloseToTarget(AI_SOFTATTACK, newTarget)
        end
        return true
      else
        if aiState == AI_CHARMED then
          SpellBuffRemoveType(me, BUFF_Taunt)
        end
        if IsPointEquals(targetPos, Make3DPoint(-1, -1, -1)) == false and aiState == AI_SOFTATTACK then
          SetStateAndMove(AI_ATTACKMOVESTATE, targetPos)
          return true
        else
          NetSetState(AI_STANDING)
          return true
        end
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
  local L0_7
  L0_7 = GetState
  L0_7 = L0_7()
  aiState = L0_7
  L0_7 = aiState
  if L0_7 ~= AI_STANDING then
    L0_7 = aiState
  elseif L0_7 == AI_IDLE then
    L0_7 = GetTargetOrFindTargetInAcR
    L0_7 = L0_7()
    if L0_7 ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L0_7)
      return true
    end
  end
  L0_7 = aiState
  if L0_7 == AI_MOVE then
    L0_7 = IsMovementStopped
    L0_7 = L0_7()
    if L0_7 then
      L0_7 = GetTargetOrFindTargetInAcR
      L0_7 = L0_7()
      if L0_7 ~= nil then
        SetStateAndCloseToTarget(AI_SOFTATTACK, L0_7)
        TurnOnAutoAttack(L0_7)
        return true
      end
      NetSetState(AI_IDLE)
      return false
    end
  end
  L0_7 = aiState
  if L0_7 == AI_ATTACKMOVESTATE then
    L0_7 = GetTargetOrFindTargetInAcR
    L0_7 = L0_7()
    if L0_7 ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L0_7)
      return true
    elseif DistanceBetweenObjectAndPoint(me, targetPos) <= 10 then
      NetSetState(AI_STANDING)
      targetPos = Make3DPoint(-1, -1, -1)
      return true
    end
  end
  L0_7 = aiState
  if L0_7 == AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION then
    L0_7 = GetLostTargetIfVisible
    L0_7 = L0_7()
    if L0_7 ~= nil then
      SetStateAndCloseToTarget(AI_HARDATTACK, L0_7)
    end
  end
end
TimerDistanceScan = L0_0
function L0_0()
  local L0_8
  L0_8 = GetTime
  L0_8 = L0_8()
  if L0_8 < GetForHelpActiveUntil() then
    L0_8 = GetState
    L0_8 = L0_8()
    aiState = L0_8
    L0_8 = aiState
    if L0_8 == AI_FEARED then
      L0_8 = false
      return L0_8
    end
    L0_8 = SetForHelpActiveUntil
    L0_8(0)
    L0_8 = GetCallForHelpAttacker
    L0_8 = L0_8()
    if aiState == AI_IDLE then
      if L0_8 ~= nil and DistanceBetweenObjects(me, L0_8) <= GetAttackRange() then
        TurnOnAutoAttack(L0_8)
        return true
      end
    elseif L0_8 ~= nil then
      SetStateAndCloseToTarget(AI_SOFTATTACK, L0_8)
      return true
    end
  end
  L0_8 = false
  return L0_8
end
CheckForCallForHelpHero = L0_0
function L0_0(A0_9, A1_10)
  Say(A0_9)
end
OnAICommand = L0_0
function L0_0()
  NetSetState(AI_IDLE)
  TimerDistanceScan()
  TimerCheckAttack()
end
OnReachedDestinationForGoingToLastLocation = L0_0
