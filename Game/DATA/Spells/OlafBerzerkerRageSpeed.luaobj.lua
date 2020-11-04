BuffTextureName = "DarkChampion_Fury.dds"
BuffName = "OlafBerzerkerRageSpeed"
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeed",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
