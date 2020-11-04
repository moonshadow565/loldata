NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Tristana_DrawABead.dds"
BuffName = "Draw a Bead"
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "detonatingshot_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_explosiveshot_unit_tar.troy"
    }
  }
}
