NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Striking"
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
      Name = "alphastriketarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_q_ap_mis.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemstatikshankcharge"
    }
  }
}
