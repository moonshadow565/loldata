NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "Zyra_hellvine"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalisbstealth"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_akalipoof2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalisbbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalisbdebuff"
    }
  }
}
