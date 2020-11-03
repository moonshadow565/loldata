OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "StartTime",
      SecondsVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "OdinBombSuccessParticle",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinBombSuppressionOrder"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinBombSuppressionChaos"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "OrderChannelCount",
      TargetVar = "Owner",
      BuffName = "OdinBombSuppressionOrder"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "ChaosChannelBuff",
      TargetVar = "Owner",
      BuffName = "OdinBombSuppressionChaos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "OrderChannelCount",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "ChaosChannelBuff",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OdinBombSuppression"
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "OrderChannelCount",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "ChaosChannelBuff",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OdinBombSuppression"
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
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
          Src2Var = "StartTime",
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
          Value2 = 0,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "ChaosChannelBuff",
              TargetVar = "Owner",
              BuffName = "OdinBombSuppressionChaos"
            }
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "OrderChannelCount",
              TargetVar = "Owner",
              BuffName = "OdinBombSuppressionOrder"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ChaosChannelBuff",
              Src2Var = "OrderChannelCount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalBuffCount",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TotalBuffCount",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalBuffCount",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "modifier",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "modifier",
                  Src1Value = 0,
                  Src2Value = -700,
                  DestVar = "modifier",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "modifier",
                  Src1Value = 0,
                  Src2Value = -7000,
                  DestVar = "PAR_to_modify",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  PARType = PAR_MANA,
                  DeltaVar = "PAR_to_modify"
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "MaxPAR",
                  OwnerVar = "Owner",
                  Function = GetMaxPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "CurrentPAR",
                  OwnerVar = "Owner",
                  Function = GetPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CurrentPAR",
                  Src2Var = "MaxPAR",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "PAR_Percent",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "PAR_Percent",
                  Value2 = 0.05,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "NewDuration",
                      SrcValue = 50
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Attacker",
                      AttackerVar = "Attacker",
                      BuffName = "MonsterBuffs"
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src2Var = "NewDuration",
                          Src1Value = 1.15,
                          Src2Value = 0,
                          DestVar = "NewDuration",
                          MathOp = MO_MULTIPLY
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBIfHasBuff,
                        Params = {
                          OwnerVar = "Attacker",
                          AttackerVar = "Attacker",
                          BuffName = "MonsterBuffs2"
                        },
                        SubBlocks = {
                          {
                            Function = BBMath,
                            Params = {
                              Src2Var = "NewDuration",
                              Src1Value = 1.3,
                              Src2Value = 0,
                              DestVar = "NewDuration",
                              MathOp = MO_MULTIPLY
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Attacker",
                      AttackerVar = "Attacker",
                      BuffName = "OdinCenterRelicBuff",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "NewDuration",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Attacker",
                      AttackerVar = "Attacker",
                      BuffName = "OdinScoreBigRelic",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 3,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Attacker",
                      AttackerVar = "Attacker",
                      BuffName = "OdinCenterRelicBuffDamage",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "NewDuration",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Owner",
                      TargetVar = "Owner",
                      Damage = 500,
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuccessparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppressionorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppressionchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincenterrelicbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscorebigrelic"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincenterrelicbuffdamage"
    }
  }
}
