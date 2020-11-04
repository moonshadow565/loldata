local L0, L1
function L0()
  local L0, L1
  L0 = PreloadCharacter
  L1 = "KingPoro"
  L0(L1)
end
OnInitClient = L0
function L0()
  local L0, L1, L2
  L0 = PreloadCharacter
  L1 = "KingPoro"
  L0(L1)
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "KINGPORO_FollowerManager"
  L2 = false
  L0(L1, L2)
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "KINGPORO_PlayerBuff"
  L2 = false
  L0(L1, L2)
end
OnInitServer = L0
