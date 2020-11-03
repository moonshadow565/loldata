BuffTextureName = "MissFortune_ImpureShots.dds"
BuffName = "MissFortunePassive"
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunepassivestack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_passive_tar_indicator.troy"
    }
  }
}
