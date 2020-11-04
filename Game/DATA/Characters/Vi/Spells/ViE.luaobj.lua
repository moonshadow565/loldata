BuffTextureName = "ViE2.dds"
BuffName = "ViE"
SpellFXOverrideSkins = {"ViRacer"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_e_activate_hands_r.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_e_activate_hands_l.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_skin02_flash_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vipassivebuff"
    }
  }
}
