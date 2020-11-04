local L0, L1
L0 = {}
EventRecipients = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9
  L2 = EventRecipients
  L2 = L2[A0]
  if L2 == nil then
    L2 = EventRecipients
    L3 = {}
    L3[1] = L4
    L2[A0] = L3
    L2 = _G
    function L3(...)
      local L1, L2, L3, L4, L5, L6, L7, L8
      for L4, L5 in L1, L2, L3 do
        L6 = _UPVALUE0_
        L6 = L5[L6]
        L7 = L5
        L8 = ...
        L6(L7, L8)
      end
    end
    L2[A0] = L3
  else
    L2 = EventRecipients
    L2 = L2[A0]
    L3 = false
    for L7, L8 in L4, L5, L6 do
      if L8 == A1 then
        L3 = true
      end
    end
    if not L3 then
      L2[L4] = A1
    end
  end
end
RegisterForEvent = L0
function L0(A0, ...)
  local L2, L3, L4
  L2 = EventRecipients
  L2 = L2[A0]
  if L2 ~= nil then
    L3 = #L2
    if 0 < L3 then
      L3 = _G
      L3 = L3[A0]
      L4 = ...
      L3(L4)
    end
  end
end
Event = L0
