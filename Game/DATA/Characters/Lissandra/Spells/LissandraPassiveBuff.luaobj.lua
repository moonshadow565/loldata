BuffTextureName = "Lissandra_Passive.dds"
BuffName = "LissandraPassiveBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandrapassiveready"
    }
  }
}
