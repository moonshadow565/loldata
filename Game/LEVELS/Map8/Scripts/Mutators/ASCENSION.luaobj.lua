local L0, L1
function L0()
  local L0, L1
  L0 = OnInit
  L0()
  L0 = PreloadCharacter
  L1 = "Leona"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "Lux"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "Xerath"
  L0(L1)
end
OnInitClient = L0
function L0()
  local L0, L1, L2
  L0 = OnInit
  L0()
  L0 = ApplyPersistentBuffToAllChampions
  L1 = "AscRespawn"
  L2 = false
  L0(L1, L2)
end
OnInitServer = L0
function L0()
  local L0, L1
  L0 = PreloadCharacter
  L1 = "AscRelic"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "AscWarpIcon"
  L0(L1)
  L0 = PreloadCharacter
  L1 = "AscXerath"
  L0(L1)
  L0 = PreloadSpell
  L1 = "AscRespawn"
  L0(L1)
end
OnInit = L0
