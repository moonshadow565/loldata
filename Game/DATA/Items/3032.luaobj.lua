AutoBuffActivateEffect = "InnervatingLocket_itm.troy "
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CooldownResevoir",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaRegenBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 1.8
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthRegenBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1200,
              Flags = "AffectFriends AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Owner",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "InnervatingLocketAuraSelf",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 4.1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
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
                    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Attacker",
                          BuffName = "InnervatingLocketAuraFriend",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 4.1,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      }
                    }
                  }
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
            Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 1200,
                  Flags = "AffectFriends AffectHeroes ",
                  IteratorVar = "Unit",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBGetPetOwner,
                    Params = {PetVar = "Owner", DestVar = "Caster"}
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Owner",
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIfNotHasBuff,
                        Params = {
                          OwnerVar = "Owner",
                          CasterVar = "Caster",
                          BuffName = "InnervatingLocketAuraSelf"
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffName = "InnervatingLocketAuraSelf",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Aura,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 4.1,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    Function = BBElseIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Caster",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Attacker",
                          BuffName = "InnervatingLocketAuraFriend",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 4.1,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
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
ItemOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "CooldownResevoir",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DoesntTriggerSpellCasts",
          Src1VarTable = "SpellVars",
          Value2 = true,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = -1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "InnervatingLocket_itm.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "InnervatingLocketBuff",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Heal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.25,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              }
            }
          }
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownResevoir",
      DestVarTable = "InstanceVars",
      SrcValue = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "innervatinglocketauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "innervatinglocketaurafriend"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "innervatinglocket_itm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "innervatinglocketbuff"
    }
  }
}
