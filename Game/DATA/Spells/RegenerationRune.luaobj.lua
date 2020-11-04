AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "bountyActive",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 45,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "LifeTime",
              Value2 = 122,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "bountyActive",
                  Src1VarTable = "InstanceVars",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIncPermanentExpReward,
                    Params = {TargetVar = "Owner", Delta = 12.5}
                  },
                  {
                    Function = BBIncPermanentGoldReward,
                    Params = {TargetVar = "Owner", Delta = 2}
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "bountyActive",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBIncPermanentExpReward,
                    Params = {TargetVar = "Owner", Delta = 1.786}
                  },
                  {
                    Function = BBIncPermanentGoldReward,
                    Params = {TargetVar = "Owner", Delta = 0.2667}
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "bountyActive",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 122,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetScaleSkinCoef,
            Params = {Scale = 1.1, OwnerVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetScaleSkinCoef,
            Params = {Scale = 1.05, OwnerVar = "Owner"}
          }
        }
      }
    }
  }
}
