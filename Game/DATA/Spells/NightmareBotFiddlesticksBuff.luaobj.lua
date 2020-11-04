BuffTextureName = "Fiddlesticks_Crowstorm.dds"
BuffName = "NightmareBotFiddlesticksBuff"
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotfiddlesticksw"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotfiddlesticksdarkwind"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotfiddlestickscrowstormsource"
    }
  }
}
