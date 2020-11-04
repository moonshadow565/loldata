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
      Name = "Lissandra_Base_Passive_Ready.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_Passive_Start.troy"
    }
  }
}
