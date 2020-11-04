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
      Name = "Khazix_Base_E_WeaponTrails.troy"
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
      Name = "Khazix_Base_E_Land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Khazix_Base_E_Tar.troy"
    }
  }
}
