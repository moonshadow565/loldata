OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StunDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "Speed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Speed",
      Src1Value = 0,
      Src2Value = 0.27,
      DestVar = "PlusBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Speed",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "PlusLess",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PlusBonus",
      Src1Value = 285,
      Src2Value = 0,
      DestVar = "UpperBound",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PlusLess",
      Src1Value = 395,
      Src2Value = 0,
      DestVar = "LowerBound",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "LowerBound",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "UpperBound",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "RevilePrevent",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 3.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Owner"}
              },
              {
                Function = BBApplyStun,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Duration = 0,
                  DurationVar = "StunDuration",
                  DurationVarTable = "InstanceVars"
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "RevileMarker"
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "Speed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Speed",
      Src1Value = 0,
      Src2Value = 0.27,
      DestVar = "PlusBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Speed",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "PlusLess",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PlusBonus",
      Src1Value = 285,
      Src2Value = 0,
      DestVar = "UpperBound",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PlusLess",
      Src1Value = 395,
      Src2Value = 0,
      DestVar = "LowerBound",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "LowerBound",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "UpperBound",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "RevilePrevent",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 3.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Owner"}
              },
              {
                Function = BBApplyStun,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Duration = 0,
                  DurationVar = "StunDuration",
                  DurationVarTable = "InstanceVars"
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "RevileMarker"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "revileprevent"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "revilemarker"
    }
  }
}
