NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
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
      Name = "jayce_model_swap.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestancehammer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivehaste"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycehyperchargemeleeattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestancehammercheck"
    }
  }
}
