BuffTextureName = "Kennen_MarkOfStorm.dds"
BuffName = "KennenMarkOfStorm"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenparticleholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_mos2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_mos_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenmosdiminish"
    }
  }
}
