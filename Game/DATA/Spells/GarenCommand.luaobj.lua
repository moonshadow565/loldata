NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenCommand"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_commandingpresence_unit_buf_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_command_cas.troy"
    }
  }
}
