BuffTextureName = "Caitlyn_Headshot2.dds"
BuffName = "Rev Up"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vipassivebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vipassiveready"
    }
  }
}
