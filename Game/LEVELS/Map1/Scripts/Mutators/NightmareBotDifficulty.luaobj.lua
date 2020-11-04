local L0, L1
L0 = 100
TEAM_ORDER = L0
L0 = 200
TEAM_CHAOS = L0
L0 = 1
DIFFICULTY_INDEX = L0
function L0(A0)
  local L1, L2, L3
  L2 = A0
  L1 = A0.GetFloat
  L1 = L1(L2)
  DIFFICULTY_INDEX = L1
  L1 = LuaForEachChampion
  L2 = TEAM_ORDER
  L3 = "SetNightmareBotDifficulty"
  L1(L2, L3)
  L1 = LuaForEachChampion
  L2 = TEAM_CHAOS
  L3 = "SetNightmareBotDifficulty"
  L1(L2, L3)
end
NightmareBotDifficultyOnInit = L0
function L0(A0)
  local L1, L2, L3, L4, L5, L6
  L1 = ApplyPersistentBuff
  L2 = A0
  L3 = "NightmareBotDifficulty"
  L4 = false
  L5 = DIFFICULTY_INDEX
  L6 = 3
  L1(L2, L3, L4, L5, L6)
end
SetNightmareBotDifficulty = L0
