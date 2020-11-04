BuffTextureName = "Fiddlesticks_Terrify.dds"
BuffName = "Fear"
AutoBuffActivateEffect = ""
PopupMessage1 = "game_floatingtext_Feared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalfear_surprise.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_hornconfetti_instant.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_fear.troy"
    }
  }
}
