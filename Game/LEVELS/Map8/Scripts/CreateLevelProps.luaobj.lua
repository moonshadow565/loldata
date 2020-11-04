local L0, L1
function L0()
  local L0, L1, L2, L3, L4, L5
  L0 = CreateChildTurret
  L1 = "Turret_OrderTurretShrine"
  L2 = "OdinOrderTurretShrine"
  L3 = TEAM_ORDER
  L4 = 1
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_ChaosTurretShrine"
  L2 = "OdinChaosTurretShrine"
  L3 = TEAM_CHAOS
  L4 = 1
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_OrderTurretShrine1"
  L2 = "OdinOrderTurretShrine"
  L3 = TEAM_ORDER
  L4 = 2
  L5 = 0
  L0(L1, L2, L3, L4, L5)
  L0 = CreateChildTurret
  L1 = "Turret_ChaosTurretShrine1"
  L2 = "OdinChaosTurretShrine"
  L3 = TEAM_CHAOS
  L4 = 2
  L5 = 0
  L0(L1, L2, L3, L4, L5)
end
CreateLevelProps = L0
