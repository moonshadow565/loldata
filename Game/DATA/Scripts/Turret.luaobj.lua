DoLuaShared("ObjectTags")
function OnInit()
  SetState(AI_HARDIDLE)
  InitTimer("TimerFindEnemies", 0.15, true)
  return false
end
turretTargetList = {}
DEBUG_MINION_STATE_TABLE = {
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
  "AI_SIEGEATTACK",
  "AI_LAST_NONPET_AI_STATE"
}
function OnTargetLost(A0_0, A1_1)
  if GetState() == AI_HALTED then
    return false
  end
  if #turretTargetList > 0 then
    newTarget = turretTargetList[1]
  else
    newTarget = FindTargetInAcRWithFilter(0, UnitTagFlags.Special_TurretIgnores)
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
function OnCallForHelp(A0_2, A1_3)
  if GetState() == AI_HALTED then
    return
  end
  if A1_3 and (GetState() == AI_HARDIDLE or GetState() == AI_HARDIDLE_ATTACKING) then
    NetSetState(AI_HARDIDLE_ATTACKING)
    SetTarget(A1_3)
  end
end
function OnReceiveImportantCallForHelp(A0_4, A1_5)
  if ObjectInAttackRange(A1_5) then
    PutTargetInTargetList(A1_5)
  end
end
function OnTauntBegin()
  if GetState() == AI_HALTED then
    return
  end
  tauntTarget = GetTauntTarget()
  if tauntTarget ~= nil then
    NetSetState(AI_TAUNTED)
    SetTarget(tauntTarget)
  end
end
function OnTauntEnd()
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
function OnCanMove()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
end
function OnCanAttack()
  if GetState() == AI_HALTED then
    return
  end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
end
function TimerFindEnemies()
  if GetState() == AI_HALTED then
    return
  end
  UpdateTargetList()
  if GetState() == AI_HARDIDLE then
    if #turretTargetList > 0 then
      newTarget = turretTargetList[1]
    else
      newTarget = FindTargetInAcRWithFilter(0, UnitTagFlags.Special_TurretIgnores)
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
function PutTargetInTargetList(A0_6)
  local L3_7, L4_8, L6_9
  L3_7 = false
  for _FORV_5_ = 1, #L6_9 do
    if turretTargetList[_FORV_5_] == A0_6 then
      L3_7 = true
      break
    end
  end
  if not L3_7 then
    L4_8[L6_9] = A0_6
  end
end
function UpdateTargetList()
  local L0_10
  L0_10 = 1
  while L0_10 <= #turretTargetList do
    if not ObjectInAttackRange(turretTargetList[L0_10]) then
      for _FORV_4_ = L0_10 + 1, #turretTargetList do
        turretTargetList[_FORV_4_ - 1] = turretTargetList[_FORV_4_]
      end
      turretTargetList[#turretTargetList] = nil
    else
      L0_10 = L0_10 + 1
    end
  end
end
function HaltAI()
  StopTimer("TimerFindEnemies")
  TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
  NetSetState(AI_HALTED)
end
