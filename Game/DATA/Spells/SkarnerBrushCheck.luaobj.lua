OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BrushChecks",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIsInBrush,
        Params = {UnitVar = "Owner", ResultVar = "BrushCheck"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "BrushCheck",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "BrushChecks",
              Src1VarTable = "InstanceVars",
              Value2 = 12,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Value1 = 0.05, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "SkarnerBrushSound",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = true
                    }
                  },
                  {
                    Function = BBSpellBuffClear,
                    Params = {
                      TargetVar = "Owner",
                      BuffName = "SkarnerBrushCheck"
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "BrushChecks",
                      DestVarTable = "InstanceVars",
                      SrcValue = 0
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
                Function = BBMath,
                Params = {
                  Src1Var = "BrushChecks",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 3,
                  DestVar = "BrushChecks",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BrushChecks",
              DestVarTable = "InstanceVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BrushChecks",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerbrushsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerbrushcheck"
    }
  }
}
