NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Teemo_MoveQuick.dds"
BuffName = "Move Quick2"
SpellToggleSlot = 2
SpellFXOverrideSkins = {"SuperTeemo"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "movequick_buf2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teemomovequickspeed"
    }
  }
}
