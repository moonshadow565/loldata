BuffTextureName = "MurderBridgeAura.dds"
BuffName = "MurderBridgeBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssdamagetracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssdamagetrackerb"
    }
  }
}
