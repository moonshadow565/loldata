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
SpellFXOverrideSkins = {
  "ZedStormNinja"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedulttargetmark"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "zedshadow"}
  }
}
