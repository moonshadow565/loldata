BuffTextureName = "Jester_CarefulStrikes.dds"
BuffName = "Backstab"
PersistsThroughDeath = true
NonDispellable = true
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "TwoShivPoison",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Target",
          CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Target",
              Src2Var = "Owner",
              CompareOp = CO_IS_TARGET_BEHIND_ME
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "CastFromBehind",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "FromBehind"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 1.25,
                  DestVar = "DamageAmount",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "AbsoluteZero_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
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
                  Src1Var = "Owner",
                  Src2Var = "Target",
                  CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Target",
                      Src2Var = "Owner",
                      CompareOp = CO_IS_TARGET_BEHIND_ME
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "DamageAmount",
                          Src1Value = 0,
                          Src2Value = 1.25,
                          DestVar = "DamageAmount",
                          MathOp = MO_MULTIPLY
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Target",
                          EffectName = "AbsoluteZero_tar.troy",
                          Flags = 0,
                          EffectIDVar = "Particle",
                          TargetObjectVar = "Target",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWVisibilityRadius = 0,
                          SendIfOnScreenOrDiscard = false
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Time",
              SpellSlotValue = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 1,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Time",
                  Value2 = 0,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "HitResult",
                      Value2 = HIT_Dodge,
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "HitResult",
                          Value2 = HIT_Miss,
                          CompareOp = CO_NOT_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "MoveSpeedMod",
                              DestVarTable = "NextBuffVars",
                              SrcValueByLevel = {
                                -0.2,
                                -0.225,
                                -0.25,
                                -0.275,
                                -0.3
                              }
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "MissChance",
                              DestVarTable = "NextBuffVars",
                              SrcValueByLevel = {
                                0.2,
                                0.225,
                                0.25,
                                0.275,
                                0.3
                              }
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Target",
                              AttackerVar = "Owner",
                              BuffName = "TwoShivPoison",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              BuffType = BUFF_Slow,
                              MaxStack = 1,
                              NumberStacks = 1,
                              Duration = 2,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0
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
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Target",
              CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Owner",
                  CompareOp = CO_IS_TARGET_BEHIND_ME
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "FromBehind",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 0.75,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
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
      Name = "castfrombehind"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "frombehind"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twoshivpoison"
    }
  }
}
