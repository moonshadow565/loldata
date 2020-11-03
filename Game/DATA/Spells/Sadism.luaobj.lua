NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "DrMundo_Sadism.dds"
BuffName = "Sadism"
AutoBuffActivateEffect = "dr_mundo_heal.troy"
AutoCooldownByLevel = {
  90,
  75,
  60
}
NonDispellable = true
SpellVOOverrideSkins = {
  "CorporateMundo"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sadismheal"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_sadism_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_sadism_cas_02.troy"
    }
  }
}
