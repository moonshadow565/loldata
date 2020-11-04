local L0_0, L1_1
function L0_0()
  local L0_2, L1_3
  L0_2 = false
  return L0_2
end
OnInit = L0_0
function L0_0(A0_4, A1_5)
  if GetState() == AI_HALTED then
    return
  end
  if GetState() == AI_TAUNTED or GetState() == AI_FEARED then
    return
  end
  if (GetState() == AI_PET_HARDATTACK or GetState() == AI_PET_HARDMOVE or GetState() == AI_PET_HARDIDLE or GetState() == AI_PET_HARDIDLE_ATTACKING or GetState() == AI_PET_HARDRETURN or GetState() == AI_PET_HARDSTOP) and (A0_4 == ORDER_ATTACKTO or A0_4 == ORDER_MOVETO or A0_4 == ORDER_ATTACKMOVE or A0_4 == ORDER_STOP) then
    return true
  end
  owner = GetOwner()
  if owner == nil then
    Die(me, DAMAGESOURCE_INTERNALRAW)
    return false
  end
  if A0_4 == ORDER_ATTACKTO then
    if A1_5 == nil then
      return false
    end
    TurnOffAutoAttack(STOPREASON_TARGET_LOST)
    SetStateAndCloseToTarget(AI_PET_ATTACK, A1_5)
    return true
  end
  if A0_4 == ORDER_MOVETO then
    if DistanceBetweenObjectAndInPosSq(me) > FAR_MOVMEMENT_DISTANCE * FAR_MOVMEMENT_DISTANCE or GetState() == AI_PET_HOLDPOSITION or GetState() == AI_PET_HOLDPOSITION_ATTACKING then
      SetStateAndCloseToTarget(AI_PET_MOVE, owner)
    end
    return true
  end
  if A0_4 == ORDER_ATTACKMOVE then
    SetStateAndCloseToTarget(AI_PET_ATTACKMOVE, owner)
    return true
  end
  if A0_4 == ORDER_STOP then
    return true
  end
  if A0_4 == ORDER_PETHARDSTOP then
    TurnOffAutoAttack(STOPREASON_TARGET_LOST)
    SetStateAndCloseToTarget(AI_PET_HARDSTOP, me)
    return true
  end
  if A0_4 == ORDER_PETHARDATTACK then
    if A1_5 == nil then
      return false
    end
    TurnOffAutoAttack(STOPREASON_TARGET_LOST)
    SetStateAndCloseToTarget(AI_PET_HARDATTACK, A1_5)
    return true
  end
  if A0_4 == ORDER_PETHARDMOVE then
    SetStateAndMoveInPos(AI_PET_HARDMOVE)
    return true
  end
  if A0_4 == ORDER_PETHARDRETURN then
    SetStateAndCloseToTarget(AI_PET_HARDRETURN, owner)
    return true
  end
  if A0_4 == ORDER_HOLD then
    SetStateAndCloseToTarget(AI_PET_HOLDPOSITION, me)
    return true
  end
  return false
end
OnOrder = L0_0
function L0_0()
  local L0_6, L1_7
  L0_6 = false
  return L0_6
end
OnTargetLost = L0_0
function L0_0(A0_8, A1_9)
end
OnCallForHelp = L0_0
function L0_0()
  local L0_10, L1_11
end
OnTauntBegin = L0_0
function L0_0()
  local L0_12, L1_13
end
OnTauntEnd = L0_0
function L0_0()
  local L0_14, L1_15
end
OnCanMove = L0_0
function L0_0()
  local L0_16, L1_17
end
OnCanAttack = L0_0
function L0_0()
  local L0_18, L1_19
end
TimerFindEnemies = L0_0
function L0_0()
  local L0_20, L1_21
end
HaltAI = L0_0
