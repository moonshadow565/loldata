BuffTextureName = "18.dds"
BuffName = "ShadowWalk"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.3
    }
  }
}
