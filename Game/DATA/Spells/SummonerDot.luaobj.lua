DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "SummonerIgnite.dds"
BuffName = "SummonerIgnite"
AutoBuffActivateEffect = "GLOBAL_watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_ignite.troy"
    }
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
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
