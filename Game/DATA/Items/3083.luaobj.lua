UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "ExtraHP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "ExtraRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
ItemOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 40,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 500,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 4,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.1,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 500,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 12.5,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExtraHP",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExtraRegen",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
