BuffTextureName = "Aatrox_Passive.dds"
BuffName = "AatroxPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxpassiveready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxpassivedeath"
    }
  }
}
