NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyFear,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 0,
      DurationByLevel = {
        1,
        1.5,
        2,
        2.5,
        3
      }
    }
  }
}
