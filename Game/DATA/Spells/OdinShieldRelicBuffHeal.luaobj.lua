BuffTextureName = "JarvanIV_GoldenAegis.dds"
BuffName = "OdinShieldRelic"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinplayerbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_healthpackheal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_mana.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinshieldrelicbuffheal"
    }
  }
}
