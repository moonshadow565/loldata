BuffTextureName = "Aatrox_Passive.dds"
BuffName = "AatroxPassiveReady"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_passive_death_activate.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxpassiveactivate"
    }
  }
}
