BuffTextureName = "Summoner_revive.dds"
BuffName = "Preservation"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HealthMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
