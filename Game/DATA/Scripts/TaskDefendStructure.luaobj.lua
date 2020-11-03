local L0, L1
L0 = 22500
MIN_FIGHT_DIST_SQ = L0
L0 = 562500
MAX_FIGHT_DIST_SQ = L0
L0 = 0
AI_MOVE = L0
L0 = 1
AI_ATTACK = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12
  L1 = GetObject
  L2 = A0.StructureID
  L1 = L1(L2)
  if L1 == nil then
    A0.Done = true
    A0.Priority = 0
    return
  end
  L2 = 0.3
  L3 = 0.25
  L4 = 0.5
  L5 = 20
  L6 = GetTime
  L6 = L6()
  L7 = GetLastTookDamageTime
  L8 = L1
  L7 = L7(L8)
  L6 = L6 - L7
  if 0 <= L6 and L5 >= L6 then
    L7 = GetDist
    L8 = GetPos
    L8 = L8()
    L9 = GetPos
    L10 = L1
    L9, L10, L11, L12 = L9(L10)
    L7 = L7(L8, L9, L10, L11, L12)
    L8 = math
    L8 = L8.sqrt
    L9 = GetMaxTravelDistSquared
    L9, L10, L11, L12 = L9()
    L8 = L8(L9, L10, L11, L12)
    L9 = L8 - L7
    L9 = L9 / L8
    L10 = L6 / L5
    L10 = 1 - L10
    L11 = L7 * L7
    L12 = MAX_FIGHT_DIST_SQ
    if L11 < L12 then
      L2 = L2 * 0.5
    else
      L11 = L7 * L7
      L12 = MIN_FIGHT_DIST_SQ
      if L11 < L12 then
        L2 = 0
      end
    end
    L11 = L2 * L9
    L11 = L11 * L10
    A0.Priority = L11
  else
    A0.Priority = 0
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = GetObject
  L2 = A0.StructureID
  L1 = L1(L2)
  L2 = Say
  L3 = "BeginTask: Defend "
  L4 = objGetName
  L5 = L1
  L4 = L4(L5)
  L3 = L3 .. L4
  L2(L3)
  L2 = TurnOffAutoAttack
  L3 = STOPREASON_TARGET_LOST
  L2(L3)
  L2 = SetStateAndMove
  L3 = AI_MOVE
  L4 = GetPos
  L5 = L1
  L4, L5 = L4(L5)
  L2(L3, L4, L5)
end
BeginTask = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6
  L1 = GetObject
  L2 = A0.StructureID
  L1 = L1(L2)
  L2 = GetDistSquared
  L3 = GetPos
  L4 = L1
  L3 = L3(L4)
  L4 = GetPos
  L4, L5, L6 = L4()
  L2 = L2(L3, L4, L5, L6)
  L3 = IsMoving
  L3 = L3()
  if not L3 then
    L3 = MAX_FIGHT_DIST_SQ
    if L2 > L3 then
      L3 = SetStateAndMove
      L4 = AI_MOVE
      L5 = GetPos
      L6 = L1
      L5, L6 = L5(L6)
      L3(L4, L5, L6)
  end
  else
    L3 = IsMoving
    L3 = L3()
    if L3 then
      L3 = MIN_FIGHT_DIST_SQ
      if L2 < L3 then
        L3 = StopMove
        L3()
      end
    end
  end
end
Tick = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
