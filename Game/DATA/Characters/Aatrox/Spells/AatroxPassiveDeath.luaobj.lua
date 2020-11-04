BuffTextureName = "Aatrox_Passive_Cooldown.dds"
BuffName = "AatroxPassiveActivate"
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
