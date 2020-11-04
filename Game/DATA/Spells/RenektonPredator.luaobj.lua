BuffTextureName = "Renekton_Predator.dds"
BuffName = "RenektonPredator"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonrageready"
    }
  }
}
