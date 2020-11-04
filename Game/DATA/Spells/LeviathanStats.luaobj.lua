BuffTextureName = "3138_Leviathan.dds"
BuffName = "LeviathanCap"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathancheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanstats"
    }
  }
}
