local L0_0
function L0_0()
  SetState(AI_HARDIDLE)
  InitTimer("TimerFindEnemies", 0.15, true)
  return false
end
OnInit = L0_0
L0_0 = {
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
  "AI_SIEGEATTACK",
  "AI_LAST_NONPET_AI_STATE"
}
L0_0[0] = "AI_IDLE"
DEBUG_MINION_STATE_TABLE = L0_0
function L0_0(A0_1, A1_2)
  if GetState() == AI_HALTED then
    return false
  end
  if A0_1 == LOST_VISIBILITY then
    return false
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
function L0_0(A0_3, A1_4)
  if GetState() == AI_HALTED then
    return
  end
  if A1_4 and (GetState() == AI_HARDIDLE or GetState() == AI_HARDIDLE_ATTACKING) then
    NetSetState(AI_HARDIDLE_ATTACKING)
    SetTarget(A1_4)
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
