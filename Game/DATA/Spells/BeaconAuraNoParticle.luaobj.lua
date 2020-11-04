BuffTextureName = "Summoner_rally.dds"
BuffName = "Rally"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FinalHPRegen",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Attacker", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "OwnerLevel",
      Src1Value = 1.47059,
      Src2Value = 0,
      DestVar = "DamageMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 8.5294,
      Src2Value = 0,
      DestVar = "DamageMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
