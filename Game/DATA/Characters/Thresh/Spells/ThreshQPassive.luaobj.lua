BuffTextureName = "Thresh_Q.dds"
BuffName = "ThreshQPassive"
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqpassive1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqpassive2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqpassive3"
    }
  }
}
