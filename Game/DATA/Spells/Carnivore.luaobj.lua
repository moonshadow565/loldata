BuffTextureName = "GreenTerror_TailSpike.dds"
BuffName = "Carnivore"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "feast"}
  }
}
