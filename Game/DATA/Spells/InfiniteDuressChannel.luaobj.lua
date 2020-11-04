NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
ChannelDuration = 1.9
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
      SrcValue = 5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        40,
        60,
        80
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "InfiniteDuressSound",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.9,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
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
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
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
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Target",
              BuffName = "Suppression"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBStopChanneling,
                Params = {
                  CasterVar = "Owner",
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
                  TargetVar = "Owner",
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
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_ATTACK,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
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
                      CasterVar = "Owner",
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
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressSound"
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
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressSound"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Suppression"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresssound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
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
