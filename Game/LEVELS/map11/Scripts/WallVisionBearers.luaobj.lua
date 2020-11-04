local L0, L1, L2, L3, L4, L5, L6, L7, L8
L0 = {}
L1 = {}
L1.Name = "BlueTop"
L2 = Make3DPoint
L3 = 2715
L4 = 54
L5 = 4860
L2 = L2(L3, L4, L5)
L1.Point = L2
L2 = {}
L2.Name = "RedTop"
L3 = Make3DPoint
L4 = 10033
L5 = 84
L6 = 12168
L3 = L3(L4, L5, L6)
L2.Point = L3
L3 = {}
L3.Name = "BlueBot"
L4 = Make3DPoint
L5 = 4822
L6 = 74
L7 = 2805
L4 = L4(L5, L6, L7)
L3.Point = L4
L4 = {}
L4.Name = "RedBot"
L5 = Make3DPoint
L6 = 12087
L7 = 92
L8 = 10159
L5 = L5(L6, L7, L8)
L4.Point = L5
L0[1] = L1
L0[2] = L2
L0[3] = L3
L0[4] = L4
VisionBearersDefinition = L0
function L0()
  local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16
  for L3, L4 in L0, L1, L2 do
    L5 = SpawnMinion
    L6 = "SRU_WallVisionBearer_"
    L7 = L4.Name
    L6 = L6 .. L7
    L7 = "SRU_WallVisionBearer"
    L8 = "Idle.lua"
    L9 = L4.Point
    L10 = TEAM_NEUTRAL
    L11 = false
    L12 = true
    L13 = true
    L14 = true
    L15 = true
    L16 = true
    L5(L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16)
  end
end
SpawnVisionBearers = L0
