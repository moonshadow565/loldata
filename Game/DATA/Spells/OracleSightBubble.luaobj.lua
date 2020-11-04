NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2026_Arcane_Protection_Potion.dds"
BuffName = "OracleElixir"
PersistsThroughDeath = true
NonDispellable = true
PermeatesThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_oracleelixirring.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elixirsight_aura_02.troy"
    }
  }
}
