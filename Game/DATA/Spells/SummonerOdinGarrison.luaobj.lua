NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "SummonerGarrison.dds"
BuffName = "Fortify"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_ally_capture_buf_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_ally_capture_buf_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_capture_pulse.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerodingarrisondebuff"
    }
  }
}
