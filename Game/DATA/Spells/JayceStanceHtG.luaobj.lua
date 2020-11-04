NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = false
BuffTextureName = "ApolloGunStance.dds"
BuffName = "ApolloStanceDance"
SpellToggleSlot = 2
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
SpellVOOverrideSkins = {
  "Jayce_Sentinel"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_model_swap2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestancegun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivehaste"
    }
  }
}
