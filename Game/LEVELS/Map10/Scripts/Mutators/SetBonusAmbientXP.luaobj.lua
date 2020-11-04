local L0, L1
L0 = 100
TEAM_ORDER = L0
L0 = 200
TEAM_CHAOS = L0
L0 = 1
AMBIENT_XP = L0
function L0(A0)
  local L1, L2, L3
  L2 = A0
  L1 = A0.GetFloat
  L1 = L1(L2)
  AMBIENT_XP = L1
  L1 = LuaForEachChampion
  L2 = TEAM_ORDER
  L3 = "InitBonusAmbientXP"
  L1(L2, L3)
  L1 = LuaForEachChampion
  L2 = TEAM_CHAOS
  L3 = "InitBonusAmbientXP"
  L1(L2, L3)
end
SetBonusAmbientXPOnInit = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6
  L1 = ApplyPersistentBuff
  L2 = A0
  L3 = "BonusAmbientXP"
  L4 = false
  L5 = 1
  L6 = 1
  L1(L2, L3, L4, L5, L6)
  L1 = AddBuffCounter
  L2 = A0
  L3 = "BonusAmbientXP"
  L4 = AMBIENT_XP
  L5 = 100
  L1(L2, L3, L4, L5)
end
InitBonusAmbientXP = L0
