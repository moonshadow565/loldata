BuffTextureName = "Malphite_SeismicShard.dds"
BuffName = "SeismicShard"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "seismicshard"
    }
  }
}
