NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ahri_SpiritRush.dds"
BuffName = "AhriTumble"
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
    Function = BBPreloadSpell,
    Params = {Name = "ahritumble"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_spiritrush_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_orb_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahritumblekick"
    }
  }
}
