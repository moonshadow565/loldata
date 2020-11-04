NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "3040_Seraphs_Embrace.dds"
BuffName = "ItemSeraphsEmbrace"
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
NonDispellable = true
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "seraphsembrace_shield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spectral_fury_cas.troy"
    }
  }
}
