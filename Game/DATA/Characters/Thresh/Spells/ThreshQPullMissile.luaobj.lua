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
      Name = "threshselfslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_q_pull_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqleap"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "threshq"}
  }
}
