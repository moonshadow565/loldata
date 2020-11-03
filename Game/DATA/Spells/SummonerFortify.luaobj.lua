NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_fortify.dds"
BuffName = "Fortify"
AutoBuffActivateEffect = "Global_Invulnerability.troy"
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
      Name = "fortifybuff"
    }
  }
}
