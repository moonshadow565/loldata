local L0, L1, L2
L0 = {}
LockMovementToRiver = L0
L0 = RegisterForEvent
L1 = "ComponentInit"
L2 = LockMovementToRiver
L0(L1, L2)
L0 = 0
numberOfClamps = L0
L0 = LockMovementToRiver
function L1(A0)
  local L1
  L1 = SetStateAndMove
  OriginalSetStateAndMove = L1
  function L1(A0, A1)
    local L2, L3, L4, L5
    L2 = 0
    numberOfClamps = L2
    L2 = A1.x
    L3 = River
    L3 = L3.TopBorder
    L3 = L3[1]
    L3 = L3.x
    if L2 < L3 then
      L2 = River
      L2 = L2.TopBorder
      L2 = L2[1]
      L2 = L2.x
      A1.x = L2
      L2 = numberOfClamps
      L2 = L2 + 1
      numberOfClamps = L2
    else
      L2 = A1.x
      L3 = River
      L3 = L3.TopBorder
      L4 = River
      L4 = L4.TopBorder
      L4 = #L4
      L3 = L3[L4]
      L3 = L3.x
      if L2 > L3 then
        L2 = River
        L2 = L2.TopBorder
        L3 = River
        L3 = L3.TopBorder
        L3 = #L3
        L2 = L2[L3]
        L2 = L2.x
        A1.x = L2
        L2 = numberOfClamps
        L2 = L2 + 1
        numberOfClamps = L2
      end
    end
    L2 = ClampToBorder
    L3 = A1
    L4 = River
    L4 = L4.TopBorder
    L5 = true
    L2 = L2(L3, L4, L5)
    A1 = L2
    L2 = ClampToBorder
    L3 = A1
    L4 = River
    L4 = L4.BottomBorder
    L5 = false
    L2 = L2(L3, L4, L5)
    A1 = L2
    L2 = numberOfClamps
    if 1 < L2 then
      L2 = Event
      L3 = "RiverCornered"
      L2(L3)
    end
    L2 = OriginalSetStateAndMove
    L3 = A0
    L4 = A1
    L2(L3, L4)
  end
  SetStateAndMove = L1
end
L0.ComponentInit = L1
function L0(A0, A1, A2)
  local L3, L4, L5, L6, L7, L8, L9, L10
  for L6 = L3, L4, L5 do
    L7 = A0.x
    L8 = A1[L6]
    L8 = L8.x
    if L7 >= L8 then
      L7 = A0.x
      L8 = L6 + 1
      L8 = A1[L8]
      L8 = L8.x
      if L7 <= L8 then
        L7 = A0.x
        L8 = A1[L6]
        L8 = L8.x
        L7 = L7 - L8
        L8 = L6 + 1
        L8 = A1[L8]
        L8 = L8.x
        L9 = A1[L6]
        L9 = L9.x
        L8 = L8 - L9
        L7 = L7 / L8
        L8 = A1[L6]
        L8 = L8.z
        L9 = L6 + 1
        L9 = A1[L9]
        L9 = L9.z
        L10 = A1[L6]
        L10 = L10.z
        L9 = L9 - L10
        L9 = L7 * L9
        L8 = L8 + L9
        if A2 then
          L9 = A0.z
          if not (L8 < L9) then
            break
          end
          A0.z = L8
          L9 = numberOfClamps
          L9 = L9 + 1
          numberOfClamps = L9
          break
        end
        L9 = A0.z
        if L8 > L9 then
          A0.z = L8
          L9 = numberOfClamps
          L9 = L9 + 1
          numberOfClamps = L9
        end
        break
      end
    end
  end
  return A0
end
ClampToBorder = L0
