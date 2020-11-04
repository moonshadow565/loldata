BuffTextureName = "3181_SanguineBlade.dds"
BuffName = "OdinBloodbursterBuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ADBuff",
      DestVarTable = "InstanceVars",
      SrcValue = 5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LSBuff",
      DestVarTable = "InstanceVars",
      SrcValue = 0.01
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "ADBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "LSBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
