NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Nautilus_Target.dds"
BuffName = "NautilusGrandLineTarget"
SpellDamageRatio = 1
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "NautilusAstronaut"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_astro_r_target_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_astro_r_target_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_r_target_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_r_target_indicator_02.troy"
    }
  }
}
