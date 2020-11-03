BuffTextureName = "3041_Mejais_Soulstealer.dds"
BuffName = "MejaisCap"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaischeck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaisstats"
    }
  }
}
