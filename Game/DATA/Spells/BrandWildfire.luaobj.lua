NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ryze_LightningFlux.dds"
BuffName = "Spell Flux"
SpellDamageRatio = 1
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "FrostFireBrand",
  "ZombieBrand"
}
SpellVOOverrideSkins = {
  "ZombieBrand"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "brandwildfire"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "brandwildfiremarker"
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
      Name = "brandconflagration_ult_tar_zombie.troy"
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
