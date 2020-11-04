BuffTextureName = "AlZahar_SummonVoidling.dds"
BuffName = "NightmareBotMalzaharBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharsummonvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotmalzaharcallofthevoid"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotmalzaharnullzone"
    }
  }
}
