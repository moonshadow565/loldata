BuffTextureName = "ViktorGravitonField.dds"
BuffName = "ViktorGravitonSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_catalyst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldnostun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldstun"
    }
  }
}
