BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.09
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = 15
    }
  }
}
