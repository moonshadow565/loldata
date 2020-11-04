NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
ChainMissileParameters = {
  MaximumHits = {
    1,
    1,
    1,
    1,
    1
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirpassivespeed"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_bloodslash.troy"
    }
  }
}
