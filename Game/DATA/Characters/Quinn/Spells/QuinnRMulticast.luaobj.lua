NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "QuinnRDashesRemaining"
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
SpellFXOverrideSkins = {
  "PhoenixQuinn",
  "QuinnValor_Phoenix"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_r_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "quinnr"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "quinnrfinale"
    }
  }
}
