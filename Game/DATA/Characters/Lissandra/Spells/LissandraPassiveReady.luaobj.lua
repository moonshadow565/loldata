BuffTextureName = "Lissandra_Passive.dds"
BuffName = "LissandraPassiveReady"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_passive_ready.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_passive_start.troy"
    }
  }
}
