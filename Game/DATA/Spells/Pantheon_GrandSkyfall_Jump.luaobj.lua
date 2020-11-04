NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 1.5
BuffTextureName = "Pantheon_GrandSkyfall.dds"
BuffName = "Pantheon Grand Skyfall"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_grandskyfall_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_gs_particle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegis_counter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegisshield"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_grandskyfall_up.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_grandskyfall"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_gs_particlered"
    }
  }
}
