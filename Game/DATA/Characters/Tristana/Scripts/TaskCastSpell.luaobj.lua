local L0, L1
L0 = false
isDrawingBead = L0
function L0(A0)
  local L1, L2, L3
  L1 = 0.3
  L2 = GetMP
  L2 = L2()
  L3 = GetTarget
  L3 = L3()
  if L3 then
    L3 = GetMaxMP
    L3 = L3()
    L3 = L2 / L3
    L3 = L3 * 0.8
    L3 = L3 * 2
    L3 = L3 * L1
    A0.Priority = L3
    L3 = true
    return L3
  end
  A0.Priority = 0
end
UpdatePriority = L0
function L0(A0)
  local L1, L2, L3, L4
  L1 = 0
  while true do
    L2 = math
    L2 = L2.random
    L3 = 0
    L4 = 3
    L2 = L2(L3, L4)
    L3 = CanUseSpell
    L4 = L2
    L3 = L3(L4)
    if L3 == 0 then
      if L2 == 0 then
        L3 = Say
        L4 = "RAPID FIRE!"
        L3(L4)
      end
      if L2 == 1 then
        L3 = isDrawingBead
        if L3 then
          L3 = Say
          L4 = "DRAWING A BEAD: OFF!"
          L3(L4)
        else
          L3 = Say
          L4 = "DRAWING A BEAD: ON!"
          L3(L4)
        end
      end
      if L2 == 2 then
        L3 = Say
        L4 = "RENDING SHOT!"
        L3(L4)
      end
      if L2 == 3 then
        L3 = Say
        L4 = "BUSTER SHOT!"
        L3(L4)
      end
      L3 = ServerCastSpell
      L4 = L2
      L3(L4)
      return
    end
    if 20 < L1 then
      return
    end
    L1 = L1 + 1
  end
end
BeginTask = L0
function L0(A0)
  local L1
end
Tick = L0
function L0()
  local L0, L1
end
OnLevelUp = L0
function L0(A0)
  local L1
end
OnTargetLost = L0
