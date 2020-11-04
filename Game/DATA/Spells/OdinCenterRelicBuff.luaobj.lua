BuffTextureName = "StormShield.dds"
BuffName = "OdinCenterRelic"
AutoBuffActivateEffect = "PotionofBrilliance_itm.troy"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_center_relic.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincenterrelicshieldcheck2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincenterrelicshieldcheck"
    }
  }
}
