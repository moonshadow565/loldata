NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2
BuffTextureName = "Pantheon_GrandSkyfall.dds"
BuffName = "PantheonR"
SpellFXOverrideSkins = {
  "PantheonSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_base_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_skin06_r_wingsappear.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_skin06_r_wingsjump.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_base_r_jump.troy"
    }
  }
}
