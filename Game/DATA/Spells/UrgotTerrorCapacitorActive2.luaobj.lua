NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "UrgotTerrorCapacitor.dds"
BuffName = "UrgotTerrorCapacitor"
AutoBuffActivateEffect = ""
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
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotterrorcapacitor_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "urgotslow"}
  }
}
