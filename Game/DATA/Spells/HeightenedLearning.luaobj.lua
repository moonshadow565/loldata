BuffTextureName = "Chronokeeper_Slow.dds"
BuffName = "Heightened Learning"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentEXPBonus,
      TargetVar = "Owner",
      Delta = 0.08
    }
  }
}
