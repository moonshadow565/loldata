BuffTextureName = "GragasExplosiveCask.dds"
BuffName = "GragasExplosiveCaskSlow"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ASDebuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "ASDebuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
