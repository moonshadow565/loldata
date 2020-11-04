BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.1
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.1
    }
  }
}
