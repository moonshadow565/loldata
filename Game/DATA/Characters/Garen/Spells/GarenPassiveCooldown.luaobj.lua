BuffTextureName = "Garen_PerseveranceCD.dds"
BuffName = "GarenPassiveCooldown"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenpassivecooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenpassiveheal"
    }
  }
}
