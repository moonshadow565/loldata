NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "3023_Wraith_Collar.dds"
BuffName = "ItemWraithCollar"
AutoBuffActivateEffect = "Global_Freeze.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  }
}
