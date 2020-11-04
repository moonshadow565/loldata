BuffTextureName = "MissFortune_Strut.dds"
BuffName = "MissFortuneStrut"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunestrutdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunestrutstacks"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_base_p_buff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
