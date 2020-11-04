OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "countHealthPotion",
      DestVarTable = "CharVars",
      TargetVar = "Owner",
      BuffName = "RegenerationPotion"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "countManaPotion",
      DestVarTable = "CharVars",
      TargetVar = "Owner",
      BuffName = "FlaskOfCrystalWater"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "countHealthPotion",
          DestVarTable = "CharVars",
          TargetVar = "Owner",
          BuffName = "RegenerationPotion"
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "countManaPotion",
          DestVarTable = "CharVars",
          TargetVar = "Owner",
          BuffName = "FlaskOfCrystalWater"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "countHealthPotion",
          Src1VarTable = "CharVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "countManaPotion",
              Src1VarTable = "CharVars",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "countHealthPotion",
          Src1VarTable = "CharVars",
          Value2 = 1,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 10,
              HealerVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "countManaPotion",
          Src1VarTable = "CharVars",
          Value2 = 1,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 5,
              PARType = PAR_MANA
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {}
