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
  "KhazixDroid"
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
      Name = "Khazix_Base_R_Evo2_Invisible_Cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Khazix_Base_R_Cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Khazix_Base_R_Invisible.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixrstealth"
    }
  }
}
