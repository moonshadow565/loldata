local L0, L1
L0 = 100
TEAM_ORDER = L0
L0 = 200
TEAM_CHAOS = L0
L0 = 3
FRONT_TOWER = L0
L0 = 0
RIGHT_LANE = L0
L0 = 1
CENTER_LANE = L0
L0 = 2
LEFT_LANE = L0
function L0()
  local L0, L1
end
OnInitClient = L0
function L0(A0)
  local L1, L2, L3
  L1 = math
  L1 = L1.floor
  L3 = A0
  L2 = A0.GetFloat
  L2 = L2(L3)
  L2 = L2 * 100
  L1 = L1(L2)
  modifier = L1
  L1 = SetBuffOnTeamTurrets
  L2 = TEAM_ORDER
  L3 = modifier
  L1(L2, L3)
  L1 = SetBuffOnTeamTurrets
  L2 = TEAM_CHAOS
  L3 = modifier
  L1(L2, L3)
end
OnInitServer = L0
function L0(A0, A1)
  local L2, L3, L4, L5, L6, L7, L8, L9, L10, L11
  for L5 = L2, L3, L4 do
    L6 = GetTurret
    L7 = A0
    L8 = L5
    L9 = FRONT_TOWER
    L6 = L6(L7, L8, L9)
    innerTurret = L6
    L6 = ApplyPersistentBuff
    L7 = innerTurret
    L8 = "ModTurretDamageToHumans"
    L9 = false
    L10 = 1
    L11 = 1
    L6(L7, L8, L9, L10, L11)
    L6 = AddBuffCounter
    L7 = innerTurret
    L8 = "ModTurretDamageToHumans"
    L9 = A1
    L10 = 100
    L6(L7, L8, L9, L10)
  end
end
SetBuffOnTeamTurrets = L0
