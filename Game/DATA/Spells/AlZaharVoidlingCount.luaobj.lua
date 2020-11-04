BuffTextureName = "AlZahar_VoidlingCharging.dds"
BuffName = "AlZaharSummonVoidlingBuff"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingcount"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharsummonvoidling"
    }
  }
}
