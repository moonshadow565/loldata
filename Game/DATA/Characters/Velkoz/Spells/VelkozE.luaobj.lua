NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellToggleSlot = 3
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
SpellFXOverrideSkins = {
  "VelkozSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_e_explo.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozestun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozresearchproc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozresearchapply"
    }
  }
}
