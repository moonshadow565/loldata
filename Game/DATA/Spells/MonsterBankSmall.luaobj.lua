BuffTextureName = "23.dds"
BuffName = "Monster Bank Small"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "healthPercent",
      Value2 = 0.99,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
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
              Src1Var = "numberUpgrades",
              Src1VarTable = "InstanceVars",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBIncPermanentExpReward,
                Params = {TargetVar = "Owner", Delta = 1.786}
              },
              {
                Function = BBIncPermanentGoldReward,
                Params = {TargetVar = "Owner", Delta = 0.2667}
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "numberUpgrades",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "numberUpgrades",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_SUBTRACT
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "MonsterBankBig",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "MonsterBankSmall"
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "numberUpgrades",
      DestVarTable = "InstanceVars",
      SrcValue = 14
    }
  },
  {
    Function = BBIncPermanentExpReward,
    Params = {TargetVar = "Owner", Delta = 12.5}
  },
  {
    Function = BBIncPermanentGoldReward,
    Params = {TargetVar = "Owner", Delta = 2}
  }
}
