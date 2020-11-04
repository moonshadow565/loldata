NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
SpellFXOverrideSkins = {
  "ZedStormNinja"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "zedpbaoe"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "zedult"}
  }
}
