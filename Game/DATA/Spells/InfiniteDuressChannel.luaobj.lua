NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
ChannelDuration = 2.1
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "Infinite Duress"
ChannelingStartBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {
      DestVar = "DuressExecuted",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NumHitsRemaining",
      DestVarTable = "CharVars",
      SrcValue = 6
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        30,
        50,
        70
      }
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 2.1
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.3,
      TrackTimeVar = "DuressExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Attacker",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_Die
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Target",
              DestVar = "canMove",
              Status = GetCanMove
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "canMove",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBStopChanneling,
                Params = {
                  CasterVar = "Attacker",
                  StopCondition = ChannelingStopCondition_Cancel,
                  StopSource = ChannelingStopSource_Casting
                }
              },
              {
                Function = BBIssueOrder,
                Params = {
                  WhomToOrderVar = "Owner",
                  TargetOfOrderVar = "Target",
                  Order = AI_ATTACKTO
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBGetTotalAttackDamage,
                Params = {
                  TargetVar = "Attacker",
                  DestVar = "TotalAttackDamage"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalAttackDamage",
                  Src1Value = 0,
                  Src2Value = 0.33,
                  DestVar = "DamageToDeal",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageToDeal",
                  Src2Var = "BonusDamage",
                  Src2VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageToDeal",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_ATTACK,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "InfiniteDuress_tar.troy",
                  Flags = 0,
                  EffectIDVar = "arr",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "NumHitsRemaining",
                  Src1VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "NumHitsRemaining",
                  DestVarTable = "CharVars",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "NumHitsRemaining",
                  Src1VarTable = "CharVars",
                  Value2 = 0,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBStopChanneling,
                    Params = {
                      CasterVar = "Attacker",
                      StopCondition = ChannelingStopCondition_Success,
                      StopSource = ChannelingStopSource_TimeCompleted
                    }
                  },
                  {
                    Function = BBIssueOrder,
                    Params = {
                      WhomToOrderVar = "Owner",
                      TargetOfOrderVar = "Target",
                      Order = AI_ATTACKTO
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressHold"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressHold"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "infiniteduress_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresshold"
    }
  }
}
