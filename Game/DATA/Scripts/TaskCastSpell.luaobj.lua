local L0, L1
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
  local L1
end
BeginTask = L0
function L0(A0)
  local L1, L2, L3
  L1 = math
  L1 = L1.random
  L2 = 0
  L3 = 3
  L1 = L1(L2, L3)
  return
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
