local L0, L1
function L0()
  local L0, L1, L2, L3, L4, L5
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_07"
  L2 = "TT_OrderTurret1"
  L3 = TEAM_ORDER
  L4 = 1
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_R_02"
  L2 = "TT_OrderTurret2"
  L3 = TEAM_ORDER
  L4 = 2
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_R_01"
  L2 = "TT_ChaosTurret1"
  L3 = TEAM_CHAOS
  L4 = 1
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_R_02"
  L2 = "TT_ChaosTurret2"
  L3 = TEAM_CHAOS
  L4 = 2
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_06"
  L2 = "TT_OrderTurret1"
  L3 = TEAM_ORDER
  L4 = 1
  L5 = 2
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_L_02"
  L2 = "TT_OrderTurret2"
  L3 = TEAM_ORDER
  L4 = 2
  L5 = 2
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_01"
  L2 = "TT_ChaosTurret1"
  L3 = TEAM_CHAOS
  L4 = 1
  L5 = 2
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_L_02"
  L2 = "TT_ChaosTurret2"
  L3 = TEAM_CHAOS
  L4 = 2
  L5 = 2
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T1_C_01"
  L2 = "TT_OrderTurret3"
  L3 = TEAM_ORDER
  L4 = 4
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_T2_C_01"
  L2 = "TT_ChaosTurret3"
  L3 = TEAM_CHAOS
  L4 = 4
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_OrderTurretShrine"
  L2 = "TT_OrderTurret4"
  L3 = TEAM_ORDER
  L4 = 0
  L5 = 1
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_ChaosTurretShrine"
  L2 = "TT_ChaosTurret4"
  L3 = TEAM_CHAOS
  L4 = 0
  L5 = 1
  L0(L1, L2, L3, L4, L5)
end
CreateLevelProps = L0
