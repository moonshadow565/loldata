NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "RumbleSkin03"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbomb"
    }
  }
}
