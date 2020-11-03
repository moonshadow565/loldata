BuffTextureName = "Chronokeeper_Slow.dds"
BuffName = "Heightened Learning"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "XpBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentEXPBonus,
      TargetVar = "Owner",
      DeltaVar = "XpBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
