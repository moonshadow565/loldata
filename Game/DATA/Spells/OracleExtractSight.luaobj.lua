NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2047_OraclesExtract.dds"
BuffName = "OracleElixir"
AutoBuffActivateEffect = "ElixirSight_aura_02.troy"
AutoBuffActivateAttachBoneName = "head"
NonDispellable = true
PermeatesThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_oracleelixirring.troy"
    }
  }
}
