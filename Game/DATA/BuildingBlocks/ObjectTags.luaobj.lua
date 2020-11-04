local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16, L17, L18, L19, L20
L0 = {}
L1 = "Champion"
L2 = "Champion_Clone"
L3 = "Minion"
L4 = "Minion_Lane"
L5 = "Minion_Lane_Siege"
L6 = "Minion_Lane_Super"
L7 = "Minion_Summon"
L8 = "Monster"
L9 = "Monster_Epic"
L10 = "Monster_Large"
L11 = "Special_SyndraSphere"
L12 = "Special_Tunnel"
L13 = "Structure"
L14 = "Structure_Trap"
L15 = "Turret"
L16 = "Turret_Outer"
L17 = "Turret_Inner"
L18 = "Turret_Inhib"
L19 = "Turret_Nexus"
L20 = "Turret_Shrine"
L0[1] = L1
L0[2] = L2
L0[3] = L3
L0[4] = L4
L0[5] = L5
L0[6] = L6
L0[7] = L7
L0[8] = L8
L0[9] = L9
L0[10] = L10
L0[11] = L11
L0[12] = L12
L0[13] = L13
L0[14] = L14
L0[15] = L15
L0[16] = L16
L0[17] = L17
L0[18] = L18
L0[19] = L19
L0[20] = L20
UnitTags = L0
L0 = {}
UnitTagFlags = L0
function L0()
  local L0, L1, L2, L3, L4, L5, L6
  L0 = UnitTagFlags
  L0.None = 0
  L0 = 1
  for L4, L5 in L1, L2, L3 do
    L6 = UnitTagFlags
    L6[L5] = L0
    L0 = L0 * 2
  end
end
_BuildTags = L0
L0 = _BuildTags
L0()
function L0(A0)
  local L1, L2, L3, L4, L5, L6, L7
  L1 = 0
  for L5 in L2, L3, L4 do
    L6 = UnitTagFlags
    L6 = L6[L5]
    if L6 ~= nil then
      L6 = UnitTagFlags
      L6 = L6[L5]
      L1 = L1 + L6
    end
  end
  return L1
end
ParseUnitTagFlags = L0
