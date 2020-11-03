BuffTextureName = "Trundle_Bite.dds"
BuffName = "TrundleQDebuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundleqdebuff_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "trundleq"}
  }
}
