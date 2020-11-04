OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HPPerLevel",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxPlayerLevel",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 9999,
      Flags = "AffectEnemies AffectFriends AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {
          TargetVar = "Unit",
          DestVar = "PlayerLevel"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "PlayerLevel",
          Src2Var = "MaxPlayerLevel",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MaxPlayerLevel",
              DestVarTable = "InstanceVars",
              SrcVar = "PlayerLevel",
              SrcValue = 0
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MyHealth",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyHealth",
          Value2 = 0.99,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 9999,
              Flags = "AffectEnemies AffectFriends AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBGetLevel,
                Params = {
                  TargetVar = "Unit",
                  DestVar = "PlayerLevel"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "PlayerLevel",
                  Src2Var = "MaxPlayerLevel",
                  Src2VarTable = "InstanceVars",
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MaxPlayerLevel",
                      DestVarTable = "InstanceVars",
                      SrcVar = "PlayerLevel",
                      SrcValue = 0
                    }
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
    Function = BBMath,
    Params = {
      Src1Var = "HPPerLevel",
      Src1VarTable = "InstanceVars",
      Src2Var = "MaxPlayerLevel",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HPIncrease",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HPIncrease",
      Delta = 0
    }
  }
}
