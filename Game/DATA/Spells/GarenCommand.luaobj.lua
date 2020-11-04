NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenCommand"
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
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
      Name = "garen_steel_commandingpresence_unit_buf_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_command_cas.troy"
    }
  }
}
