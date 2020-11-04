NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3056_Ohmwrecker.dds"
BuffName = "ItemFaithShaker"
AutoCooldownByLevel = {
  50,
  50,
  50,
  50,
  50
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemfaithshakerfreezeparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "neutralize_tower.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretglowparticle"
    }
  }
}
