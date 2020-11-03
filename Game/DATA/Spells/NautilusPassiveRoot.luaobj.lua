BuffTextureName = "Nautilus_StaggeringBlow.dds"
BuffName = "NautilusPassiveRoot"
PopupMessage1 = "game_floatingtext_Snared"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_astro_passive_root.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_passive_root_02.troy"
    }
  }
}
