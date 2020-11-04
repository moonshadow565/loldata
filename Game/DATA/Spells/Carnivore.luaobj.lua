BuffTextureName = "GreenTerror_TailSpike.dds"
BuffName = "Carnivore"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_battlecast_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globallifesteal_buf.troy"
    }
  }
}
