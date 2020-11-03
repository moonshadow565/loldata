NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Chronokeeper_Haste.dds"
BuffName = "Time Warp"
AutoBuffActivateEffect = "ChronoClockFast_tar.troy"
AutoBuffActivateEffect2 = "Global_Haste.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "timewarpslow"
    }
  }
}
