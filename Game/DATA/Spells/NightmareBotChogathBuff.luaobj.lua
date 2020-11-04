BuffTextureName = "GreenTerror_Feast.dds"
BuffName = "NightmareBotChogathBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotchogathrupture"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotchogathferalscream"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotchogathfeast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotchogathfeast_internal"
    }
  }
}
