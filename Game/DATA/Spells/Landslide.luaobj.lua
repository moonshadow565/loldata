NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "ReefMalphite",
  "GlacialMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "landslide_blue_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_glacial_landslide.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "landslide_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "landslidedebuff"
    }
  }
}
