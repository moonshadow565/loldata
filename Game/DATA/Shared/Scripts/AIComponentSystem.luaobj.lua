local L0, L1, L2
L0 = {}
Components = L0
L0 = DoLuaShared
L1 = "EventSystem"
L0(L1)
L0 = {}
L1 = "AIComponentSystem.lua"
L2 = "EventSystem.lua"
L0[1] = L1
L0[2] = L2
IncludedFiles = L0
function L0(A0)
  local L1, L2, L3, L4, L5
  L1 = "AIComponent"
  L2 = A0
  L1 = L1 .. L2
  L2 = DoLuaShared
  L3 = L1
  L2(L3)
  L2 = IncludedFiles
  L3 = IncludedFiles
  L3 = #L3
  L3 = L3 + 1
  L4 = L1
  L5 = ".lua"
  L4 = L4 .. L5
  L2[L3] = L4
  L2 = Components
  L3 = Components
  L3 = #L3
  L3 = L3 + 1
  L4 = _G
  L4 = L4[A0]
  L2[L3] = L4
end
AddComponent = L0
