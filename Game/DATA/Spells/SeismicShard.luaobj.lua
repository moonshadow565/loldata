BuffTextureName = "Malphite_SeismicShard.dds"
BuffName = "SeismicShard"
SpellFXOverrideSkins = {
  "GlacialMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "seismicshardbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "seismicshard_tar_glacial.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "seismicshard_tar.troy"
    }
  }
}
