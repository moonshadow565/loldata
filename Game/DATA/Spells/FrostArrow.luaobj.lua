NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "Frost Arrow"
AutoBuffActivateEffect = "Global_Freeze.troy"
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "frostarrowapplicator"
    }
  }
}
