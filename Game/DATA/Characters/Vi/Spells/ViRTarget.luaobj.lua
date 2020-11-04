NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ViR.dds"
BuffName = "ViRTarget"
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
      Name = "vi_r_target_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_r_target_indicator.troy"
    }
  }
}
