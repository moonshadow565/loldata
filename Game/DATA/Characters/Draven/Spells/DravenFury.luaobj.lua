NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Draven_Bloodrage.dds"
BuffName = "DravenFury"
AutoBuffActivateEffect = "Draven_Base_W_move_buf.troy"
SpellFXOverrideSkins = {
  "DravenSkin03"
}
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
