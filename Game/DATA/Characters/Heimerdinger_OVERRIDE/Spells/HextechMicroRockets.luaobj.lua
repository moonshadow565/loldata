NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerrcd"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_r_cast.troy"
    }
  }
}
