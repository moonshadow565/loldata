BuffTextureName = "48thSlave_WaveOfLoathing.dds"
BuffName = "BlessingoftheLizardElder"
AutoBuffActivateEffect = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_red_offense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Attacker",
      BuffName = "APBonusDamageToTowers"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NewDuration",
              SrcValue = 150
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
                  Src1Value = 1.2,
                  Src2Value = 0,
                  DestVar = "NewDuration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
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
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPetOwner,
        Params = {PetVar = "Attacker", DestVar = "Caster"}
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Caster", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "NewDuration",
                  SrcValue = 150
                }
              },
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Caster",
                  AttackerVar = "Caster",
                  BuffName = "MonsterBuffs"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "NewDuration",
                      Src1Value = 1.2,
                      Src2Value = 0,
                      DestVar = "NewDuration",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Caster",
                  AttackerVar = "Caster",
                  BuffAddType = BUFF_REPLACE_EXISTING,
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
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
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
                        Function = BBGetLevel,
                        Params = {TargetVar = "Owner", DestVar = "Level"}
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "TickDamage",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            10,
                            10,
                            15,
                            15,
                            20,
                            20,
                            25,
                            25,
                            30,
                            30,
                            35,
                            35,
                            40,
                            40,
                            45,
                            45,
                            50,
                            50
                          }
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "attackSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "Burning",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Damage,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 1,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Owner", CompareOp = CO_IS_RANGED},
                        SubBlocks = {
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "MoveSpeedMod",
                              DestVarTable = "NextBuffVars",
                              SrcValue = 0,
                              SrcValueByLevel = {
                                -0.05,
                                -0.05,
                                -0.05,
                                -0.05,
                                -0.05,
                                -0.05,
                                -0.1,
                                -0.1,
                                -0.1,
                                -0.1,
                                -0.1,
                                -0.1,
                                -0.15,
                                -0.15,
                                -0.15,
                                -0.15,
                                -0.15,
                                -0.15
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
                            Function = BBIfHasBuff,
                            Params = {
                              OwnerVar = "Owner",
                              AttackerVar = "Nothing",
                              BuffName = "JudicatorRighteousFury"
                            },
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcValue = 0,
                                  SrcValueByLevel = {
                                    -0.05,
                                    -0.05,
                                    -0.05,
                                    -0.05,
                                    -0.05,
                                    -0.05,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.15,
                                    -0.15,
                                    -0.15,
                                    -0.15,
                                    -0.15,
                                    -0.15
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
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcValue = 0,
                                  SrcValueByLevel = {
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.1,
                                    -0.2,
                                    -0.2,
                                    -0.2,
                                    -0.2,
                                    -0.2,
                                    -0.2,
                                    -0.3,
                                    -0.3,
                                    -0.3,
                                    -0.3,
                                    -0.3,
                                    -0.3
                                  }
                                }
                              }
                            }
                          }
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "AttackSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "Slow",
                          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                          StacksExclusive = true,
                          BuffType = BUFF_Slow,
                          MaxStack = 100,
                          NumberOfStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "neutralmonster_buf_red_offense.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "burning"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
