BuffTextureName = "Janna_Tailwind.dds"
BuffName = "Tailwind"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.03
    }
  }
}
