NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
SpellFXOverrideSkins = {
  "ReefMalphite",
  "GlacialMalphite",
  "MalphiteSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_base_unstoppableforce_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_glacial_unstopable_force_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_base_unstoppableforce_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "unstoppableforce_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcestun"
    }
  }
}
