local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16, L17, L18, L19, L20, L21, L22, L23, L24, L25, L26, L27, L28
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
L11 = "Special_AzirW"
L12 = "Special_AzirR"
L13 = "Special_EpicMonsterIgnores"
L14 = "Special_SyndraSphere"
L15 = "Special_TeleportTarget"
L16 = "Special_Tunnel"
L17 = "Special_TurretIgnores"
L18 = "Special_Void"
L19 = "Structure"
L20 = "Structure_Inhibitor"
L21 = "Structure_Nexus"
L22 = "Structure_Turret"
L23 = "Structure_Turret_Outer"
L24 = "Structure_Turret_Inner"
L25 = "Structure_Turret_Inhib"
L26 = "Structure_Turret_Nexus"
L27 = "Structure_Turret_Shrine"
L28 = "Ward"
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
L0[21] = L21
L0[22] = L22
L0[23] = L23
L0[24] = L24
L0[25] = L25
L0[26] = L26
L0[27] = L27
L0[28] = L28
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
  L1 = {}
  for L5 in L2, L3, L4 do
    L6 = UnitTagFlags
    L6 = L6[L5]
    if L6 ~= nil then
      L6 = #L1
      L6 = L6 + 1
      L7 = UnitTagFlags
      L7 = L7[L5]
      L1[L6] = L7
    end
  end
  return L1
end
ParseUnitTagFlags = L0
