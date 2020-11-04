NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
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
      Name = "monkeyking_q_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotmonkeykingnimbuskick"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "monkeykingclone"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "monkeykingflying"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotmonkeykingnimbuskickclone"
    }
  }
}
