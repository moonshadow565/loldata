NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "Summoner_Exhaust.dds"
BuffName = "ExhaustDebuff"
AutoBuffActivateEffect = "summoner_banish.troy"
AutoBuffActivateEffect2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
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
      Name = "exhaustslow"
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
      Name = "exhaustdebuff"
    }
  }
}
