local L0_0, L1_1
L0_0 = 1000
FAR_MOVMEMENT_DISTANCE = L0_0
L0_0 = 2000
TELEPORT_DISTANCE = L0_0
L0_0 = 500
FEAR_WANDER_DISTANCE = L0_0
function L0_0()
  SetState(AI_PET_IDLE)
  InitTimer("TimerScanDistance", 0.15, true)
  InitTimer("TimerFindEnemies", 0.15, true)
  InitTimer("TimerFeared", 1, true)
  StopTimer("TimerFeared")
  return false
end
OnInit = L0_0
function L0_0(A0_2, A1_3)
  aiState = GetState()
  if aiState == AI_TAUNTED or aiState == AI_FEARED then
    return
  end
  if (aiState == AI_PET_HARDATTACK or aiState == AI_PET_HARDMOVE or aiState == AI_PET_HARDIDLE or aiState == AI_PET_HARDIDLE_ATTACKING or aiState == AI_PET_HARDRETURN) and (A0_2 == ORDER_ATTACKTO or A0_2 == ORDER_MOVETO or A0_2 == ORDER_ATTACKMOVE) then
    return true
  end
  owner = GetOwner()
  if owner == nil then
    Die(me, DAMAGESOURCE_INTERNALRAW)
    return false
  end
  if A0_2 == ORDER_ATTACKTO then
    if A1_3 == nil then
      return false
    end
    TurnOffAutoAttack(STOPREASON_TARGET_LOST)
    SetStateAndCloseToTarget(AI_PET_ATTACK, A1_3)
    return true
  end
  if A0_2 == ORDER_MOVETO then
    if DistanceBetweenObjectAndInPos(me) > FAR_MOVMEMENT_DISTANCE then
      SetStateAndCloseToTarget(AI_PET_MOVE, owner)
    end
    return true
  end
  if A0_2 == ORDER_ATTACKMOVE then
    SetStateAndCloseToTarget(AI_PET_ATTACKMOVE, owner)
    return true
  end
  if A0_2 == ORDER_PETHARDATTACK then
    if A1_3 == nil then
      return false
    end
    TurnOffAutoAttack(STOPREASON_TARGET_LOST)
    SetStateAndCloseToTarget(AI_PET_HARDATTACK, A1_3)
    return true
  end
  if A0_2 == ORDER_PETHARDMOVE then
    SetStateAndMoveInPos(AI_PET_HARDMOVE)
    return true
  end
  if A0_2 == ORDER_PETHARDRETURN then
    SetStateAndCloseToTarget(AI_PET_HARDRETURN, owner)
    return true
  end
  Say("BAD ORDER DUDE! ")
  return false
end
OnOrder = L0_0
function L0_0()
  aiState = GetState()
  if aiState == AI_PET_MOVE or aiState == AI_PET_HARDMOVE or aiState == AI_PET_HARDRETURN or aiState == AI_FEARED then
    return true
  end
  newTarget = FindTargetInAcR()
  if newTarget == nil then
    owner = GetOwner()
    if owner == nil then
      Die(me, DAMAGESOURCE_INTERNALRAW)
      return false
    end
    if aiState == AI_PET_HARDIDLE_ATTACKING then
      NetSetState(AI_PET_HARDIDLE)
      return true
    elseif aiState == AI_PET_RETURN_ATTACKING then
      SetStateAndCloseToTarget(AI_PET_RETURN, owner)
      return true
    elseif aiState == AI_PET_ATTACKMOVE_ATTACKING then
      SetStateAndCloseToTarget(AI_PET_ATTACKMOVE, owner)
      return true
    end
  elseif aiState == AI_PET_HARDATTACK or aiState == AI_PET_ATTACK or aiState == AI_TAUNTED then
    SetStateAndCloseToTarget(AI_PET_ATTACK, newTarget)
    return true
  elseif aiState == AI_PET_HARDIDLE_ATTACKING then
    NetSetState(AI_PET_HARDIDLE_ATTACKING)
    SetTarget(newTarget)
    return true
  elseif aiState == AI_PET_RETURN_ATTACKING then
    SetStateAndCloseToTarget(AI_PET_RETURN_ATTACKING, newTarget)
    return true
  elseif aiState == AI_PET_ATTACKMOVE_ATTACKING then
    SetStateAndCloseToTarget(AI_PET_ATTACKMOVE_ATTACKING, newTarget)
    return true
  end
  NetSetState(AI_PET_IDLE)
  return true
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
    SetStateAndCloseToTarget(AI_PET_ATTACK, tauntTarget)
  else
    NetSetState(AI_PET_IDLE)
    TimerFindEnemies()
  end
end
OnTauntEnd = L0_0
function L0_0()
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  ResetAndStartTimer("TimerFeared")
end
OnFearBegin = L0_0
function L0_0()
  StopTimer("TimerFeared")
  NetSetState(AI_PET_IDLE)
  TimerFindEnemies()
end
OnFearEnd = L0_0
function L0_0()
  wanderPoint = MakeWanderPoint(GetFearLeashPoint(), FEAR_WANDER_DISTANCE)
  SetStateAndMove(AI_FEARED, wanderPoint)
end
TimerFeared = L0_0
function L0_0()
  NetSetState(AI_PET_IDLE)
  TimerFindEnemies()
end
OnCanMove = L0_0
function L0_0()
  NetSetState(AI_PET_IDLE)
  TimerFindEnemies()
end
OnCanAttack = L0_0
function L0_0()
  tempOwner = GetOwner()
  if tempOwner == nil then
    Die(me, DAMAGESOURCE_INTERNALRAW)
    return
  end
  distanceToOwner = DistanceBetweenObjects(me, tempOwner)
  if distanceToOwner > TELEPORT_DISTANCE then
    SetActorPositionFromObject(me, tempOwner)
    NetSetState(AI_PET_IDLE)
    return
  end
  aiState = GetState()
  bNoEnemiesNear = FindTargetInAcR() == nil
  if aiState == AI_PET_IDLE and distanceToOwner > GetPetReturnRadius(me) and bNoEnemiesNear then
    SetStateAndCloseToTarget(AI_PET_RETURN, tempOwner)
    return
  end
  if (aiState == AI_PET_RETURN or aiState == AI_PET_HARDRETURN) and distanceToOwner <= GetPetReturnRadius(me) then
    NetSetState(AI_PET_IDLE)
    return
  end
  if not OwnerIsMoving() and (aiState == AI_PET_MOVE or aiState == AI_PET_ATTACKMOVE and bNoEnemiesNear) then
    NetSetState(AI_PET_IDLE)
    return
  end
  if not IsMoving() and aiState == AI_PET_HARDMOVE then
    NetSetState(AI_PET_HARDIDLE)
    return
  end
  if aiState == AI_PET_SPAWNING and IsNetworkLocal() then
    NetSetState(AI_PET_IDLE)
  end
end
TimerScanDistance = L0_0
function L0_0()
  if GetOwner() == nil then
    Die(me, DAMAGESOURCE_INTERNALRAW)
    return
  end
  aiState = GetState()
  if aiState == AI_PET_MOVE or aiState == AI_PET_HARDMOVE then
    return
  end
  if aiState == AI_PET_IDLE or aiState == AI_PET_RETURN or aiState == AI_PET_ATTACKMOVE or aiState == AI_PET_HARDIDLE then
    newTarget = FindTargetInAcR()
    if newTarget == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    if aiState == AI_PET_IDLE then
      SetStateAndCloseToTarget(AI_PET_ATTACK, newTarget)
    elseif aiState == AI_PET_RETURN then
      SetStateAndCloseToTarget(AI_PET_RETURN_ATTACKING, newTarget)
    elseif aiState == AI_PET_ATTACKMOVE then
      SetStateAndCloseToTarget(AI_PET_ATTACKMOVE_ATTACKING, newTarget)
    elseif aiState == AI_PET_HARDIDLE then
      NetSetState(AI_PET_HARDIDLE_ATTACKING)
      SetTarget(newTarget)
    end
  end
  if aiState == AI_PET_ATTACK or aiState == AI_PET_HARDATTACK or aiState == AI_PET_RETURN_ATTACKING or aiState == AI_PET_ATTACKMOVE_ATTACKING or aiState == AI_PET_HARDIDLE_ATTACKING or aiState == AI_TAUNTED then
    if TargetInAttackRange() then
      TurnOnAutoAttack(GetTarget())
    elseif TargetInCancelAttackRange() == false then
      TurnOffAutoAttack(STOPREASON_MOVING)
    end
    return
  end
end
TimerFindEnemies = L0_0
