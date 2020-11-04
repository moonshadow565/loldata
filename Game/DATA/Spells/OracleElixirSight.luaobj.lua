NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2026_Arcane_Protection_Potion.dds"
BuffName = "OracleElixir"
PersistsThroughDeath = true
NonDispellable = true
PermeatesThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oraclesightbubble"
    }
  }
}
