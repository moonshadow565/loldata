BuffTextureName = "AlZahar_VoidlingReady.dds"
BuffName = "AlZaharSummonVoidlingReady"
AutoBuffActivateEffect = "Voidling_Ready.troy"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "malzaharvoidling"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "malzaharvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
