NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Irelia_Bladesurge.dds"
BuffName = "IreliaGatotsu"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_ability_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_mana_refresh.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_cast_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_cast_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliagatotsudash"
    }
  }
}
