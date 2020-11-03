OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RunAnim",
      DestVarTable = "InstanceVars",
      SrcValue = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MS"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MS",
      Value2 = 405,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "RunAnim",
          Src1VarTable = "InstanceVars",
          Value2 = 3,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RunAnim",
              DestVarTable = "InstanceVars",
              SrcValue = 3
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Run",
              OverrideAnim = "Run3",
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "MS",
      Value2 = 355,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "RunAnim",
          Src1VarTable = "InstanceVars",
          Value2 = 2,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RunAnim",
              DestVarTable = "InstanceVars",
              SrcValue = 2
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Run",
              OverrideAnim = "Run2",
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "RunAnim",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RunAnim",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          },
          {
            Function = BBClearOverrideAnimation,
            Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
          }
        }
      }
    }
  }
}
