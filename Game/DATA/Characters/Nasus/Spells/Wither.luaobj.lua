NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_Wither.dds"
BuffName = "Wither"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_w_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_wither_tar.troy"
    }
  }
}
