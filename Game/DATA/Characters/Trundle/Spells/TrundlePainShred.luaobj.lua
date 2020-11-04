BuffTextureName = "Trundle_R.dds"
BuffName = "TrundlePainShred"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlepainbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundleultparticle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_r_grow.troy"
    }
  }
}
