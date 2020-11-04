BuffTextureName = "VeigarDarkMatter.dds"
BuffName = "NightmareBotVeigarBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotveigarq"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotveigarw"
    }
  }
}
