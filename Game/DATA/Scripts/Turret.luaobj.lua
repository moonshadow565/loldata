local L0_0, L1_1
function L0_0()
  SetState(AI_HARDIDLE)
  InitTimer("TimerFindEnemies", 0.15, true)
  return false
end
OnInit = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  newTarget = FindTargetInAcR()
  if newTarget == nil then
    if GetState() == AI_HARDIDLE_ATTACKING or GetState() == AI_TAUNTED then
      NetSetState(AI_HARDIDLE)
      return true
    end
  elseif GetState() == AI_HARDIDLE_ATTACKING or GetState() == AI_TAUNTED then
    NetSetState(AI_HARDIDLE_ATTACKING)
    SetTarget(newTarget)
    return true
  end
  NetSetState(AI_HARDIDLE)
  return true
end
OnTargetLost = L0_0
function L0_0(A0_2, A1_3)
  if GetState() == AI_HALTED then
    return
  end
  if A1_3 and (GetState() == AI_HARDIDLE or GetState() == AI_HARDIDLE_ATTACKING) then
    NetSetState(AI_HARDIDLE_ATTACKING)
    SetTarget(A1_3)
  end
end
OnCallForHelp = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    NetSetState(AI_TAUNTED)
    SetTarget(tauntTarget)
  end
end
OnTauntBegin = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    NetSetState(AI_HARDIDLE_ATTACKING)
    SetTarget(tauntTarget)
  else
    NetSetState(AI_HARDIDLE)
    TimerFindEnemies()
  end
end
OnTauntEnd = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
end
OnCanMove = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
end
OnCanAttack = L0_0
function L0_0()
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_HARDIDLE then
    newTarget = FindTargetInAcR()
    if newTarget == nil then
      TurnOffAutoAttack(STOPREASON_TARGET_LOST)
      return
    end
    if GetState() == AI_HARDIDLE then
      NetSetState(AI_HARDIDLE_ATTACKING)
      SetTarget(newTarget)
    end
  end
  if GetState() == AI_HARDIDLE_ATTACKING or GetState() == AI_TAUNTED then
    if TargetInAttackRange() then
      TurnOnAutoAttack(GetTarget())
    else
      NetSetState(AI_HARDIDLE)
      TurnOffAutoAttack(STOPREASON_MOVING)
    end
  end
end
TimerFindEnemies = L0_0
function L0_0()
  StopTimer("TimerFindEnemies")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
