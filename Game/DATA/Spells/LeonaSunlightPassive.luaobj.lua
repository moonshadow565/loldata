BuffTextureName = "LeonaSunlight.dds"
BuffName = "LeonaSunlightPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasolarbarriertracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasunlight"
    }
  }
}
