NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_Wither.dds"
BuffName = "Wither"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
AutoBuffActivateEffect2 = "nassus_wither_tar.troy"
AutoBuffActivateEffect3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "wither"}
  }
}
