PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "PreviousTakeDamageTime",
      SecondsVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DealtDamage",
      DestVarTable = "InstanceVars",
      SrcValue = 0
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
        Function = BBGetGameTime,
        Params = {
          SecondsVar = "CurrentTime"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurrentTime",
          Src2Var = "PreviousTakeDamageTime",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TimePassed",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TimePassed",
          Value2 = 10,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinGuardianRegen",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 4,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "PreviousTakeDamageTime",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentTime"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "DealtDamage",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "TimePassed",
              Value2 = 0.5,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DealtDamage",
                  DestVarTable = "InstanceVars",
                  SrcValue = 1
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "MyMaxHealth",
                  OwnerVar = "Owner",
                  Function = GetMaxHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "MyMaxHealth",
                  Src1Value = 0.6,
                  Src2Value = 0,
                  DestVar = "HealthToDecreaseBy",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Owner",
                  Damage = 0,
                  DamageVar = "HealthToDecreaseBy",
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_INTERNALRAW,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianRegen",
      NumStacks = 0
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "PreviousTakeDamageTime",
      SecondsVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianregen"
    }
  }
}
