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
IsDeathRecapSource = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrae5sound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrae5missile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_ecast.troy"
    }
  }
}
