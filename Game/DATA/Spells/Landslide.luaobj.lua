NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "ReefMalphite",
  "GlacialMalphite",
  "MalphiteSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_base_landslide_blue_nova.troy"
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
      Name = "malphite_base_landslide_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "landslidedebuff"
    }
  }
}
