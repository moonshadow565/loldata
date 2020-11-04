BuffTextureName = "Aatrox_Passive.dds"
BuffName = "AatroxPassiveReady"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Passive_Death_Activate.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxpassiveactivate"
    }
  }
}
