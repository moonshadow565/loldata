BuffTextureName = "Cassiopeia_PetrifyingGaze.dds"
BuffName = "MonkeyKingPassive"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DefenseToAdd",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 4, Index = 1}
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseToAdd",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseToAdd",
      DeltaVarTable = "InstanceVars",
      Delta = 0
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
        Function = BBSetVarInTable,
        Params = {DestVar = "Count", SrcValue = 0}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1400,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Count",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "Count",
                  MathOp = MO_ADD
                }
              }
            }
          }
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "OwnerLevel",
          Value2 = 12,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Count",
              Src1Value = 0,
              Src2Value = 8,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DefenseToAdd",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 40,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 8, Index = 1}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "OwnerLevel",
          Value2 = 6,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Count",
              Src1Value = 0,
              Src2Value = 6,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DefenseToAdd",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 30,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 6, Index = 1}
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
              Src1Var = "Count",
              Src1Value = 0,
              Src2Value = 4,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DefenseToAdd",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 20,
              DestVar = "DefenseToAdd",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 4, Index = 1}
          }
        }
      }
    }
  }
}
