NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
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
  CanHitSameTargetConsecutively = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyparagonstats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyparagonparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyparagonspeed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyparagonicon"
    }
  }
}
