local L0, L1
function L0()
  local L0, L1, L2, L3, L4
  L0 = SetState
  L1 = AI_IDLE
  L0(L1)
  L0 = GetGoldRedirectTarget
  L0 = L0()
  if L0 == nil then
    L1 = Die
    L2 = me
    L3 = DAMAGESOURCE_INTERNALRAW
    L1(L2, L3)
    return
  end
  L1 = EnableTargetTracking
  L2 = me
  L3 = L0
  L4 = 4
  L1(L2, L3, L4)
  L1 = false
  return L1
end
OnInit = L0
function L0(A0, A1, A2)
  local L3, L4, L5
  L3 = ORDER_CASTSPELL
  if A0 == L3 then
    L3 = AddTeleportToTargetTracking
    L4 = me
    L5 = A2
    L3(L4, L5)
  end
  L3 = true
  return L3
end
OnOrder = L0
