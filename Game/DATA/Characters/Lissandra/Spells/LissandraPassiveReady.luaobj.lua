BuffTextureName = "Lissandra_Passive.dds"
BuffName = "LissandraPassiveReady"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "Lissandra_skin01"
}
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
