NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SyndraJusticar",
  "SyndraSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_rhit2.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
