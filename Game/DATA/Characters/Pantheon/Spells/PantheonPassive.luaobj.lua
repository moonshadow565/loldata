BuffTextureName = "Pantheon_AOZ.dds"
BuffName = "Pantheon Aegis"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheonpassivecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheonpassiveshield"
    }
  }
}
