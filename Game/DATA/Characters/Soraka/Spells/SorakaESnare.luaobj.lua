BuffTextureName = "Soraka_E.dds"
BuffName = "SorakaESnare"
PopupMessage1 = "game_floatingtext_Rooted"
SpellFXOverrideSkins = {
  "SorakaSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lulukitty"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_w_polymorph_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_base_e_snare_tar.troy"
    }
  }
}
