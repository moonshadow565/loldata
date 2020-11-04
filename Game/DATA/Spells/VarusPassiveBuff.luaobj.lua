NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "12.dds"
BuffName = "VarusPassiveBuff"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivebuffdisplay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivebuffdisplayminion"
    }
  }
}
