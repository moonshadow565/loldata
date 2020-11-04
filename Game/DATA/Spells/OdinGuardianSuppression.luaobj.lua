AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "odin_suppression.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "Crystal",
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
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "StartTime",
      SecondsVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Duration = 0.5
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "MyTeamID",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OldMyTeamID",
      DestVarTable = "InstanceVars",
      SrcVar = "MyTeamID",
      SrcVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinGuardianSuppressionOrder"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinGuardianSuppressionChaos"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "OrderChannelCount",
      TargetVar = "Owner",
      BuffName = "OdinGuardianSuppressionOrder"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "ChaosChannelBuff",
      TargetVar = "Owner",
      BuffName = "OdinGuardianSuppressionChaos"
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
              BuffName = "OdinGuardianSuppression"
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
              BuffName = "OdinGuardianSuppression"
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
      TimeBetweenExecutions = 0.25,
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
          Value2 = 1.5,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Run", SrcValue = 1}
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "ChaosChannelBuff",
              TargetVar = "Owner",
              BuffName = "OdinGuardianSuppressionChaos"
            }
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "OrderChannelCount",
              TargetVar = "Owner",
              BuffName = "OdinGuardianSuppressionOrder"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "ChaosChannelBuff",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "OrderChannelCount",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "Run", SrcValue = 0}
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
                    Function = BBSetVarInTable,
                    Params = {DestVar = "Run", SrcValue = 0}
                  }
                }
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "OrderChannelCount",
              Src2Var = "ChaosChannelBuff",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalBuffCount",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Run",
              Value2 = 1,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalBuffCount",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "DamageMultiplier",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageMultiplier",
                  Src1Value = 0,
                  Src2Value = 0.4,
                  DestVar = "DamageMultiplier",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "PrilisasBlessingCount",
                  TargetVar = "Owner",
                  BuffName = "PrilisasBlessing"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "PrilisasBlessingCount",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageMultiplier",
                      Src1Value = 0,
                      Src2Value = 1.31,
                      DestVar = "DamageMultiplier",
                      MathOp = MO_ADD
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
                      Src1Var = "DamageMultiplier",
                      Src1Value = 0,
                      Src2Value = 1.06,
                      DestVar = "DamageMultiplier",
                      MathOp = MO_ADD
                    }
                  }
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "TotalHP",
                  OwnerVar = "Owner",
                  Function = GetMaxPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalHP",
                  Src1Value = 0,
                  Src2Value = 0.0294,
                  DestVar = "DtD",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageMultiplier",
                  Src2Var = "DtD",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DtD",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBGetTeamID,
                Params = {
                  TargetVar = "Owner",
                  DestVar = "MyTeamID",
                  DestVarTable = "InstanceVars"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "MyTeamID",
                  Src1VarTable = "InstanceVars",
                  Value2 = TEAM_NEUTRAL,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "OldMyTeamID",
                      Src1VarTable = "InstanceVars",
                      Src2Var = "MyTeamID",
                      Src2VarTable = "InstanceVars",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffRemove,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "OdinCaptureSoundEmptying",
                          ResetDuration = 0
                        }
                      }
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "OldMyTeamID",
                      DestVarTable = "InstanceVars",
                      SrcVar = "MyTeamID",
                      SrcVarTable = "InstanceVars"
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinCaptureSoundFilling",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "ChaosChannelBuff",
                      Value2 = 0,
                      CompareOp = CO_GREATER_THAN
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "DtD",
                          Src1Value = 0,
                          Src2Value = -0.5,
                          DestVar = "DtD",
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
                        Function = BBMath,
                        Params = {
                          Src1Var = "DtD",
                          Src1Value = 0,
                          Src2Value = 0.5,
                          DestVar = "DtD",
                          MathOp = MO_MULTIPLY
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
                    Function = BBIf,
                    Params = {
                      Src1Var = "OldMyTeamID",
                      Src1VarTable = "InstanceVars",
                      Src2Var = "MyTeamID",
                      Src2VarTable = "InstanceVars",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffRemove,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "OdinCaptureSoundFilling",
                          ResetDuration = 0
                        }
                      }
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "OldMyTeamID",
                      DestVarTable = "InstanceVars",
                      SrcVar = "MyTeamID",
                      SrcVarTable = "InstanceVars"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DtD",
                      Src1Value = 0,
                      Src2Value = -1,
                      DestVar = "DtD",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinCaptureSoundEmptying",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              },
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  PARType = PAR_MANA,
                  DeltaVar = "DtD"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_suppression.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppressionorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppressionchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "prilisasblessing"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincapturesoundemptying"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincapturesoundfilling"
    }
  }
}
