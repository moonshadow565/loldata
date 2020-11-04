NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "Yasuo_Q3.dds"
BuffName = "YasuoQ3W"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q_wind_ready_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_yasuo_wind_anivia_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuoq3wautosmartcast"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q_ready_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q3_indicator_ring.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yasuoqw"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_q3_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_q3_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yasuoq3"}
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
  }
}
