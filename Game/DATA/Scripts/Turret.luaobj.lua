local L0_0
function L0_0()
  SetState(AI_HARDIDLE)
  InitTimer("TimerFindEnemies", 0.15, true)
  return false
end
OnInit = L0_0
L0_0 = {}
turretTargetList = L0_0
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
  if #turretTargetList > 0 then
    newTarget = turretTargetList[1]
  else
    newTarget = FindTargetInAcR()
  end
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
function L0_0(A0_5, A1_6)
  if ObjectInAttackRange(A1_6) then
    PutTargetInTargetList(A1_6)
  end
end
OnReceiveImportantCallForHelp = L0_0
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
  UpdateTargetList()
  if GetState() == AI_HARDIDLE then
    if #turretTargetList > 0 then
      newTarget = turretTargetList[1]
    else
      newTarget = FindTargetInAcR()
    end
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
function L0_0(A0_7)
  local L3_8, L4_9, L6_10
  L3_8 = false
  for _FORV_5_ = 1, #L6_10 do
    if turretTargetList[_FORV_5_] == A0_7 then
      L3_8 = true
      break
    end
  end
  if not L3_8 then
    L4_9[L6_10] = A0_7
  end
end
PutTargetInTargetList = L0_0
function L0_0()
  local L0_11
  L0_11 = 1
  while L0_11 <= #turretTargetList do
    if not ObjectInAttackRange(turretTargetList[L0_11]) then
      for _FORV_4_ = L0_11 + 1, #turretTargetList do
        turretTargetList[_FORV_4_ - 1] = turretTargetList[_FORV_4_]
      end
      turretTargetList[#turretTargetList] = nil
    else
      L0_11 = L0_11 + 1
    end
  end
end
UpdateTargetList = L0_0
function L0_0()
  StopTimer("TimerFindEnemies")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
HaltAI = L0_0
