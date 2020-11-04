UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "TempLevel"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempLevel",
      Src2Var = "OwnerLevel",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 300,
          HealerVar = "Owner"
        }
      },
      {
        Function = BBIncMana,
        Params = {TargetVar = "Owner", Delta = 250}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "OwnerLevel",
          DestVarTable = "InstanceVars",
          SrcVar = "TempLevel"
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerLevel",
      DestVarTable = "InstanceVars"
    }
  }
}
