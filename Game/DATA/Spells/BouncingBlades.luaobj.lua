NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect = ""
ChainMissileParameters = {
  MaximumHits = {
    2,
    3,
    4,
    5,
    6
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "killerinstinct"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "killerinstinctbuff2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
