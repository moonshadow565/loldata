NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffName = "DefensiveBallCurl"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_q_splitimplosion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_q_splitexplosion.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozqsplitactivate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "velkozq"}
  }
}
