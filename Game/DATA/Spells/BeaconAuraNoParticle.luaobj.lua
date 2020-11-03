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
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "OwnerLevel", SrcValue = 1}
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "OwnerLevel",
      Src1Value = 0.883,
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
      Src1Value = 9.117,
      Src2Value = 0,
      DestVar = "DamageMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageMod",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "ApMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
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
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "ApMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
