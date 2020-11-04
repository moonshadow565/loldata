NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_shadowdance_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_shadowdance_return_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_shadowdance_return.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowdancekick"
    }
  }
}
