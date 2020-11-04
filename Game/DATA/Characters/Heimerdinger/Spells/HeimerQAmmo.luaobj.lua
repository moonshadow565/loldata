BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "TechmaturgicalIcon"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerqspell1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretready"
    }
  }
}
