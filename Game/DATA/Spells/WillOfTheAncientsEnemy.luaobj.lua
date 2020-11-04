BuffTextureName = "2008_Tome_of_Combat_Mastery.dds"
BuffName = "WillOfTheAncientsEnemy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AP_Debuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "AP_Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
