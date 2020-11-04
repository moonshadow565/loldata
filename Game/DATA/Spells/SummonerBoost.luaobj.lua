NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Summoner_boost.dds"
BuffName = "Cleanse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_cleanse.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_cleanse_avatar.troy"
    }
  }
}
