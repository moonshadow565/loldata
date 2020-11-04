BuffTextureName = "Aatrox_Passive_Cooldown.dds"
BuffName = "AatroxPassiveActivate"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxpassiveready"
    }
  }
}
