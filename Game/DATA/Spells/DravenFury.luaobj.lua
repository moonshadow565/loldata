NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Draven_Bloodrage.dds"
BuffName = "DravenFury"
AutoBuffActivateEffect = "Draven_W_move_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "dravenfury"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenfurybuff"
    }
  }
}
