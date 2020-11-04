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
  "KhazixDroid",
  "KhazixSkin03"
}
SpellVOOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "khazixe"}
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
  }
}
