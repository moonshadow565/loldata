NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ryze_LightningFlux.dds"
BuffName = "Spell Flux"
SpellDamageRatio = 1
AutoCooldownByLevel = {
  150,
  120,
  90
}
ChainMissileParameters = {
  MaximumHits = {
    5,
    5,
    5,
    5,
    5
  },
  CanHitCaster = 1,
  CanHitSameTarget = 1,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spellflux_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "desperatepower_aoe.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "manaleach_tar.troy"
    }
  }
}
