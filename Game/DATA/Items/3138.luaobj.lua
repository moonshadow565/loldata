AutoBuffActivateEffect = "Abyssalscepter_itm.troy"
AutoItemActivateEffect = ""
AutoAuraBuffName = ""
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "LeviathanCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0.4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "LeviathanStats"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 10,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "LeviathanCap",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Aura,
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
      BuffName = "LeviathanStats"
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
              BuffName = "LeviathanStats",
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
              BuffName = "LeviathanStats",
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
              BuffName = "LeviathanStats",
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
              BuffName = "LeviathanStats",
              NumStacks = 4
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
      Name = "leviathancheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanstats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathancap"
    }
  }
}
