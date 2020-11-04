NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "Summoner_Exhaust.dds"
BuffName = "SummonerExhaustDebuff"
AutoBuffActivateEffect = "summoner_banish.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerexhaustslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerexhaust"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerexhaustdebuff"
    }
  }
}
