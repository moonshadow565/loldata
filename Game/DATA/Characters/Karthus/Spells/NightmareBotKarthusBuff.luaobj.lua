BuffTextureName = "Karthus_Passive.dds"
BuffName = "NightmareBotKarthusBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotkarthusdeathdefiedbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotkarthuswallofpain"
    }
  }
}
