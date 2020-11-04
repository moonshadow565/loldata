AutoBuffActivateEffect = "Abyssalscepter_itm.troy"
AutoItemActivateEffect = ""
AutoAuraBuffName = ""
UpdateSelfBuffActionsBuildingBlocks = {
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "MuramasaCheck",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 1.2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "MuramasaStats"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 20,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaCap",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
ItemOnDeathBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "MuramasaStats"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "Count",
          Src1Value = 0.33,
          Src2Value = 0,
          DestVar = "Count",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Value2 = 2.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 2
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Value2 = 3.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 3
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Value2 = 4.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 4
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Value2 = 5.5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 5
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Value2 = 7,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "MuramasaStats",
              NumStacks = 6
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
      Name = "muramasacheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasastats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasacap"
    }
  }
}
