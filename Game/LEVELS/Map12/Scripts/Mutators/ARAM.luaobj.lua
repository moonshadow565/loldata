local L0, L1
function L0()
  local L0, L1
end
OnInitClient = L0
function L0()
  local L0, L1, L2
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "HowlingAbyssAura"
  L2 = true
  L0(L1, L2)
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "AramShopDisableNoParticle"
  L2 = false
  L0(L1, L2)
end
OnInitServer = L0
