BuffTextureName = "Lucian_Q.dds"
BuffName = "LucianQ"
SpellFXOverrideSkins = {
  "LucianSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lucianpassivebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_q_laser.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_q_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_aa_tar.troy"
    }
  }
}
