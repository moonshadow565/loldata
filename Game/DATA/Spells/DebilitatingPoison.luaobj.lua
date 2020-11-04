NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffName = "DebilitatingPoison"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
AutoBuffActivateEffect2 = "twitch_debilitatingPoison_tar.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deadlyvenom"
    }
  }
}
