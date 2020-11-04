NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = "JarvanQuick_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Run3",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "Attacker",
      Speed = 1400,
      Gravity = 1,
      MoveBackBy = 1,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 500
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 400,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Unit",
          CompareOp = CO_IS_TARGET_BEHIND_ME
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "JarvanIVDragonStrikeBehindMe",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = true
            }
          }
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 260,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Unit",
          BuffName = "SlashBeenHit"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Unit",
              DestVar = "IsStealthed",
              Status = GetStealthed
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "IsStealthed",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "SlashBeenHit",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "BloodSlash.troy",
                  Flags = 0,
                  EffectIDVar = "particle",
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "JarvanIVDragonStrikePH2",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
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
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SlashBeenHit",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
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
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "BloodSlash.troy",
                      Flags = 0,
                      EffectIDVar = "particle",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "JarvanIVDragonStrikePH2",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Stun,
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
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBCanSeeTarget,
                    Params = {
                      ViewerVar = "Owner",
                      TargetVar = "Unit",
                      ResultVar = "CanSee"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "CanSee",
                      Value2 = true,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "SlashBeenHit",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                        Function = BBBreakSpellShields,
                        Params = {TargetVar = "Unit"}
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "BloodSlash.troy",
                          Flags = 0,
                          EffectIDVar = "particle",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "JarvanIVDragonStrikePH2",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Stun,
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 260,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Unit",
              BuffName = "SlashBeenHit"
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Attacker",
              BuffName = "JarvanIVDragonStrikeBehindMe"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 1,
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBGetStatus,
                    Params = {
                      TargetVar = "Unit",
                      DestVar = "IsStealthed",
                      Status = GetStealthed
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "IsStealthed",
                      Value2 = false,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "SlashBeenHit",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                        Function = BBBreakSpellShields,
                        Params = {TargetVar = "Unit"}
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "BloodSlash.troy",
                          Flags = 0,
                          EffectIDVar = "particle",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "JarvanIVDragonStrikePH2",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Stun,
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
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                        SubBlocks = {
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Owner",
                              BuffName = "SlashBeenHit",
                              BuffAddType = BUFF_STACKS_AND_RENEWS,
                              StacksExclusive = true,
                              BuffType = BUFF_Internal,
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
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "BloodSlash.troy",
                              Flags = 0,
                              EffectIDVar = "particle",
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
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Owner",
                              BuffName = "JarvanIVDragonStrikePH2",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Stun,
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
                        Function = BBElse,
                        Params = {},
                        SubBlocks = {
                          {
                            Function = BBCanSeeTarget,
                            Params = {
                              ViewerVar = "Owner",
                              TargetVar = "Unit",
                              ResultVar = "CanSee"
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {
                              Src1Var = "CanSee",
                              Value2 = true,
                              CompareOp = CO_EQUAL
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Owner",
                                  BuffName = "SlashBeenHit",
                                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Internal,
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
                                Function = BBBreakSpellShields,
                                Params = {TargetVar = "Unit"}
                              },
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "BloodSlash.troy",
                                  Flags = 0,
                                  EffectIDVar = "particle",
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
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Owner",
                                  BuffName = "JarvanIVDragonStrikePH2",
                                  BuffAddType = BUFF_RENEW_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Stun,
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
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 260,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Unit",
          BuffName = "SlashBeenHit"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Unit",
              DestVar = "IsStealthed",
              Status = GetStealthed
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "IsStealthed",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "SlashBeenHit",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "BloodSlash.troy",
                  Flags = 0,
                  EffectIDVar = "particle",
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "JarvanIVDragonStrikePH2",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
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
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SlashBeenHit",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
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
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "BloodSlash.troy",
                      Flags = 0,
                      EffectIDVar = "particle",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "JarvanIVDragonStrikePH2",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Stun,
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
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBCanSeeTarget,
                    Params = {
                      ViewerVar = "Owner",
                      TargetVar = "Unit",
                      ResultVar = "CanSee"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "CanSee",
                      Value2 = true,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "SlashBeenHit",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                        Function = BBBreakSpellShields,
                        Params = {TargetVar = "Unit"}
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "BloodSlash.troy",
                          Flags = 0,
                          EffectIDVar = "particle",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "JarvanIVDragonStrikePH2",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Stun,
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
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikebehindme"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "slashbeenhit"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bloodslash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikeph2"
    }
  }
}
