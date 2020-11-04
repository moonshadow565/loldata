NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
BuffName = "BraumThatsMyCarry"
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
    Params = {
      Name = "braumwdummyspell"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "braumwdash"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "braumwpassivestatsdoubler"
    }
  }
}
