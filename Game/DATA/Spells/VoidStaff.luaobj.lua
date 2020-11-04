OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.4
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = -0.4
    }
  }
}
