NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Khazix_R_count.dds"
BuffName = "KhazixR"
SpellToggleSlot = 4
PersistsThroughDeath = true
ChainMissileParameters = {
  MaximumHits = {
    10,
    10,
    10,
    10,
    10
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
SpellFXOverrideSkins = {
  "KhazixDroid",
  "KhazixSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "khazixr"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixpdamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_r_evo2_invisible_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_r_invisible.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixrstealth"
    }
  }
}
