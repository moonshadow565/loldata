NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotannieincinerate"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "incinerate_cas.troy"
    }
  }
}
