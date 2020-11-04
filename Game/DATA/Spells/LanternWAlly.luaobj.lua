NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
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
      Name = "lanterndashsound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lanternwallydash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lanternwallydashparticle"
    }
  }
}
