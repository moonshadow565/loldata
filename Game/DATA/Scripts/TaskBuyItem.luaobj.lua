local L0, L1, L2, L3, L4, L5, L6
L0 = 500
MIN_DIST_TO_SHOP = L0
L0 = 0
AI_MOVE = L0
L0 = 1
AI_SHOP = L0
L0 = {}
L1 = 1001
L2 = 2003
L3 = 1006
L4 = 1007
L5 = 1042
L6 = 1029
L0[1] = L1
L0[2] = L2
L0[3] = L3
L0[4] = L4
L0[5] = L5
L0[6] = L6
ITEMS_TO_BUY = L0
L0 = 1
BUY_INDEX = L0
function L0(A0)
  local L1
  L1 = BUY_INDEX
  L1 = L1 + 1
  BUY_INDEX = L1
  L1 = BUY_INDEX
  if 6 < L1 then
    L1 = 1
    BUY_INDEX = L1
  end
end
ChangeItemToBuy = L0
function L0(A0)
  local L1, L2
  L1 = ITEMS_TO_BUY
  L2 = BUY_INDEX
  L1 = L1[L2]
  return L1
end
GetNextItemToBuy = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7
  L1 = A0.ItemToBuy
  if L1 == nil then
    L1 = GetNextItemToBuy
    L1 = L1()
    A0.ItemToBuy = L1
  end
  L1 = GetNumInvSlotsAvailable
  L1 = L1()
  if L1 < 1 then
    A0.Priority = 0
    return
  end
  L1 = GetGold
  L1 = L1()
  L2 = GetItemPrice
  L3 = A0.ItemToBuy
  L2 = L2(L3)
  L3 = 1
  L4 = GetRegroupPos
  L4 = L4()
  L5 = GetDist
  L6 = L4
  L7 = GetPos
  L7 = L7()
  L5 = L5(L6, L7)
  if L1 < L2 then
    A0.Priority = 0
  elseif L1 >= L2 then
    L6 = 2 * L2
    if L1 > L6 then
      L3 = 1.1
    end
    if L5 < 3000 then
      L6 = 0.8 * L3
      A0.Priority = L6
    elseif 3000 < L5 and L5 < 6000 then
      L6 = 6000 / L5
      L6 = L6 * 0.2
      L6 = L6 * L3
      A0.Priority = L6
    else
      L6 = 0.2 * L3
      A0.Priority = L6
    end
  end
  L6 = A0.Priority
  if 0.9 < L6 then
    A0.Priority = 0.9
  end
  L6 = GetItemPrice
  L7 = A0.ItemToBuy
  L6 = L6(L7)
  if L6 == 0 then
    A0.Priority = 0
    A0.ItemToBuy = nil
  end
end
UpdatePriority = L0
function L0(A0)
  local L1, L2
  L1 = TurnOffAutoAttack
  L2 = STOPREASON_IMMEDIATELY
  L1(L2)
  L1 = SetState
  L2 = AI_SHOP
  L1(L2)
end
BeginTask = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = GetRegroupPos
  L1 = L1()
  L2 = GetDist
  L3 = L1
  L4 = GetPos
  L4, L5 = L4()
  L2 = L2(L3, L4, L5)
  L3 = GetState
  L3 = L3()
  L4 = AI_SHOP
  if L3 == L4 then
    L3 = MIN_DIST_TO_SHOP
    if L2 > L3 then
      L3 = SetStateAndMove
      L4 = AI_MOVE
      L5 = L1
      L3(L4, L5)
    end
  end
  L3 = MIN_DIST_TO_SHOP
  if L2 <= L3 then
    L3 = GetState
    L3 = L3()
    L4 = AI_MOVE
    if L3 == L4 then
      L3 = StopMove
      L3()
      L3 = SetState
      L4 = AI_SHOP
      L3(L4)
    end
    L3 = GetGold
    L3 = L3()
    L4 = GetItemPrice
    L5 = A0.ItemToBuy
    L4 = L4(L5)
    if L3 > L4 then
      L3 = BuyItem
      L4 = A0.ItemToBuy
      L3(L4)
      L4 = A0
      L3 = A0.ChangeItemToBuy
      L3(L4)
      L3 = GetNextItemToBuy
      L3 = L3()
      A0.ItemToBuy = L3
      L4 = A0
      L3 = A0.UpdatePriority
      L3(L4)
    end
  end
end
Tick = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
