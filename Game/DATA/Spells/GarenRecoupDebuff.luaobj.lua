BuffTextureName = "Garen_PerseveranceCD.dds"
BuffName = "GarenRecoupDebuff"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrecoupdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrecouperate1"
    }
  }
}
