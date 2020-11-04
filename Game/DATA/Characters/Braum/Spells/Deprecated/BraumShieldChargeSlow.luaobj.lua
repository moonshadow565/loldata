BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "Global_Freeze.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_waterlog_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_waterlog_debuf.troy"
    }
  }
}
