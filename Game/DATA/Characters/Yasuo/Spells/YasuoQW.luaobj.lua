NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "YasuoQ1.dds"
BuffName = "YasuoQ2Open"
SpellToggleSlot = 1
OnPreDamagePriority = 3
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
SpellFXOverrideSkins = {
  "YasuoSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_q1_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q1_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_yasuo_q_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yasuoq"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_q_windstrike.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q_windstrike.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_q_windstrikeblade.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q_windstrikeblade.troy"
    }
  }
}
