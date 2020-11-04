local L0, L1
function L0()
  local L0, L1, L2
  L0 = ClientCheat_SpawnMinion
  L1 = "Bear"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Skeleton_Minion_Melee"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Skeleton_Minion_Rider"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Skeleton_Minion_Archer"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Order_Minion_Archer"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Order_Minion_Melee"
  L2 = 100
  L0(L1, L2)
  L0 = ClientCheat_SpawnMinion
  L1 = "Order_Minion_Rider"
  L2 = 100
  L0(L1, L2)
end
SpawnSomeMinions = L0
function L0()
  local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  spacing = L0
  numRows = L0
  numColumns = L0
  xo = L0
  yo = L0
  zo = L0
  for L3 = L0, L1, L2 do
    z = L4
    for L7 = L4, L5, L6 do
      L8 = xo
      L9 = spacing
      L9 = L7 * L9
      L8 = L8 + L9
      x = L8
      L8 = Make3DPoint
      L9 = x
      L10 = yo
      L11 = z
      L8 = L8(L9, L10, L11)
      spawnLocation = L8
      L8 = CreateGameObject
      L9 = "obj_GeneralParticleEmmiter"
      L10 = "Data\\Particles\\WorkInProgress.troy"
      L11 = spawnLocation
      L8(L9, L10, L11)
    end
  end
end
SpawnSomeParticles = L0
function L0()
  local L0, L1, L2, L3
  L0 = ClientCheat_ToggleFogOfWar
  L0()
  L0 = ClientCheat_ToggleInvulnerable
  L0()
  L0 = ClientCheat_ToggleBarracks
  L0()
  L0 = SpawnSomeParticles
  L0()
  L0 = r3dParticleSystem_SetFlags
  L1 = 1
  L0(L1)
  L0 = ParticleSystem_SetFlags
  L1 = 1
  L0(L1)
  L0 = InitTimer
  L1 = "PerfTest_BeginMeasurement"
  L2 = 15
  L3 = false
  L0(L1, L2, L3)
  L0 = InitTimer
  L1 = "PerfTest_EndMeasurement"
  L2 = 30
  L3 = false
  L0(L1, L2, L3)
end
PerfTest_Run = L0
