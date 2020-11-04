BuffTextureName = "Renekton_Predator.dds"
BuffName = "RenektonPredator"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
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
