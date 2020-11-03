local L0, L1
function L0()
  local L0, L1, L2, L3, L4, L5
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_08"
  L2 = "ARAMOrderTurretFront"
  L3 = TEAM_ORDER
  L4 = 4
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_07"
  L2 = "ARAMOrderTurretInhib"
  L3 = TEAM_ORDER
  L4 = 3
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_09"
  L2 = "ARAMOrderTurretNexus"
  L3 = TEAM_ORDER
  L4 = 2
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_010"
  L2 = "ARAMOrderTurretNexus"
  L3 = TEAM_ORDER
  L4 = 1
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_01"
  L2 = "ARAMChaosTurretFront"
  L3 = TEAM_CHAOS
  L4 = 4
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_02"
  L2 = "ARAMChaosTurretInhib"
  L3 = TEAM_CHAOS
  L4 = 3
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_03"
  L2 = "ARAMChaosTurretNexus"
  L3 = TEAM_CHAOS
  L4 = 2
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_04"
  L2 = "ARAMChaosTurretNexus"
  L3 = TEAM_CHAOS
  L4 = 1
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_OrderTurretShrine"
  L2 = "ARAMOrderTurretShrine"
  L3 = TEAM_ORDER
  L4 = 0
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_ChaosTurretShrine"
  L2 = "ARAMChaosTurretShrine"
  L3 = TEAM_CHAOS
  L4 = 0
  L5 = 1
  L0(L1, L2, L3, L4, L5)
end
CreateLevelProps = L0
function L0()
  local L0, L1, L2, L3, L4, L5
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_07"
  L2 = "OrderTurretTutorial"
  L3 = TEAM_ORDER
  L4 = 3
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_08"
  L2 = "OrderTurretTutorial"
  L3 = TEAM_ORDER
  L4 = 4
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_01"
  L2 = "ChaosTurretTutorial"
  L3 = TEAM_CHAOS
  L4 = 3
  L5 = 1
  L0(L1, L2, L3, L4, L5)
end
CreateLevelPropsTutorial = L0
