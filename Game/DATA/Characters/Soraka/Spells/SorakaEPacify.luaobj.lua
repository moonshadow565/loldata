BuffTextureName = "Soraka_E.dds"
BuffName = "SorakaEPacify"
PopupMessage1 = "game_floatingtext_Silenced"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lulukitty"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_silence.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_w_polymorph_01.troy"
    }
  }
}
