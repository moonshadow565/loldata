BuffTextureName = "Teemo_Camouflage.dds"
BuffName = "CamouflageStealth"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "camouflagebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "camouflagecheck"
    }
  }
}
