local L0, L1
function L0()
  local L0, L1
  L0 = PreloadSpell
  L1 = "FireIceFinisher"
  L0(L1)
end
OnInitClient = L0
function L0()
  local L0, L1, L2
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "FireIceFinisher"
  L2 = false
  L0(L1, L2)
end
OnInitServer = L0
