NotSingleTargetSpell = false
DoesntBreakShields = True
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "FrostFireBrand"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "brandwildfire"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "brandconflagration_tar_frost.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "brandconflagration_tar_zombie.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "brandconflagration_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "brandablaze"
    }
  }
}
