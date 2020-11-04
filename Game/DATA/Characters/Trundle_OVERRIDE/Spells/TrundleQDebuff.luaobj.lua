BuffTextureName = "Trundle_Q.dds"
BuffName = "TrundleQDebuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundleqdebuff_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_q_bite_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "trundleq"}
  }
}
