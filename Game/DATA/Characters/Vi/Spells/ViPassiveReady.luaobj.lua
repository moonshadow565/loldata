BuffTextureName = "ViPassive.dds"
BuffName = "ViPassiveReady"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_passive_ready.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_passive_backpack.troy"
    }
  }
}
