BuffTextureName = "3065_Spirit_Visage.dds"
BuffName = "Spirit Visage"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.12
    }
  }
}
