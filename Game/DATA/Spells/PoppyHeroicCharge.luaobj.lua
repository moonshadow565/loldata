NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Striking"
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
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepart2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepoppyfix"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_tar.troy"
    }
  }
}
