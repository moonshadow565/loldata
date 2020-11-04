OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "DeceiveCritChance"
    }
  }
}
