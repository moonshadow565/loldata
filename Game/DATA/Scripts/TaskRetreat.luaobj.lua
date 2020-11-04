local L0, L1
L0 = {}
function L1(A0)
  local L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15
  L1 = 1
  L2 = 0.25
  L3 = GetRegroupPos
  L3 = L3()
  L4 = GetDist
  L5 = L3
  L6 = GetPos
  L6, L7, L8, L9, L13, L14, L15 = L6()
  L4 = L4(L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15)
  L5 = math
  L5 = L5.sqrt
  L6 = GetMaxTravelDistSquared
  L6, L7, L8, L9, L13, L14, L15 = L6()
  L5 = L5(L6, L7, L8, L9, L10, L11, L12, L13, L14, L15)
  L6 = math
  L6 = L6.max
  L7 = L4 / L5
  L7 = 1 - L7
  L8 = 0
  L6 = L6(L7, L8)
  L7 = math
  L7 = L7.max
  L8 = GetHP
  L8 = L8()
  L9 = GetMaxHP
  L9 = L9()
  L8 = L8 / L9
  L8 = 1 - L8
  L9 = 0
  L7 = L7(L8, L9)
  if 0.9 < L6 and 0 < L7 then
    L7 = 1
  end
  L8 = L2 * L6
  L9 = 1 - L2
  L8 = L8 + L9
  L9 = L1 * L8
  L9 = L9 * L7
  A0.Priority = L9
  L9 = os
  L9 = L9.time
  L9 = L9()
  for L13, L14 in L10, L11, L12 do
    L15 = L9 - 2
    if L13 < L15 then
      L15 = _UPVALUE0_
      L15[L13] = nil
    elseif L13 == L9 then
      L15 = GetHP
      L15 = L15()
      if L14 > L15 then
        L15 = _UPVALUE0_
        L15[L13] = L14
      end
    end
  end
  if not L10 then
    L10[L9] = L11
  end
  if L10 then
    if 110 < L10 then
      A0.Priority = 1
    end
  end
end
UpdatePriority = L1
function L1(A0)
  local L1, L2, L3, L4
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_TARGET_LOST
  L1(L2)
  L1 = GetRegroupPos
  L1 = L1()
  L2 = SetStateAndMove
  L3 = 0
  L4 = L1
  L2(L3, L4)
end
BeginTask = L1
function L1(A0)
  local L1
end
Tick = L1
function L1(A0)
  local L1
end
OnTargetLost = L1
