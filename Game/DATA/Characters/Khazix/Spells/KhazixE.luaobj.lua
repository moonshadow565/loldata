NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
SpellFXOverrideSkins = {
  "KhazixDroid"
}
SpellVOOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixetarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_e_land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_e_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixelanding"
    }
  }
}
