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
          Src2Value = 45,
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
          Src2Value = 0.3,
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
          Src2Value = 450,
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
          Src2Value = 3,
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
          Src2Value = 4.5,
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
          Src2Value = 0.03,
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
          Src2Value = 450,
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
          Src2Value = 3,
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
ItemOnAssistBuildingBlocks = {
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
          Src2Value = 45,
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
          Src2Value = 0.3,
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
          Src2Value = 450,
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
          Src2Value = 3,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      }
    }
  }
}
