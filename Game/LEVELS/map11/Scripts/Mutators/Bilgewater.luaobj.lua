local L0, L1
function L0()
  local L0, L1
  L0 = PreloadSpell
  L1 = "BWPlayerBuff"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneMelee_Order"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneMelee_Chaos"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneRanged_Order"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneRanged_Chaos"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneCannon_Order"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BilgeLaneCannon_Chaos"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BW_Razorfin"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BW_Ironback"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BW_Plundercrab"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "BW_Ocklepod"
  L0(L1)
end
OnInitClient = L0
function L0()
  local L0, L1, L2
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "BWPlayerBuff"
  L2 = false
  L0(L1, L2)
end
OnInitServer = L0
