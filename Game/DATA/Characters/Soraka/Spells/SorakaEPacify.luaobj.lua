BuffTextureName = "Soraka_E.dds"
BuffName = "SorakaEPacify"
AutoBuffActivateEffect = "LOC_Silence.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PopupMessage1 = "game_floatingtext_Silenced"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lulukitty"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "loc_silence.troy"
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
