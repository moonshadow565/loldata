NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "fioradance"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioradancestatus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioradancetarget"
    }
  }
}
