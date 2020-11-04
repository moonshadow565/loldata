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
      Name = "khazix_r_evo_invis_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_r_invis_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_r_self_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixrstealth"
    }
  }
}
