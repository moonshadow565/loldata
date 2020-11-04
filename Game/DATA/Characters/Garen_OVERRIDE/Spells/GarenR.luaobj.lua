NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garendeathcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_r_sword_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_r_tar_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_r_indicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrvomarker"
    }
  }
}
