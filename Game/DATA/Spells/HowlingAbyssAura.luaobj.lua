BuffTextureName = "MurderBridgeAura.dds"
BuffName = "HowlingAbyssAura"
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
