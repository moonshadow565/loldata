BuffTextureName = "Vladimir_TidesofBlood.dds"
BuffName = "VladimirTidesofBloodCost"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = 0.08
    }
  }
}
