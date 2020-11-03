NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Bowmaster_ArchersMark.dds"
BuffName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Sprung",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Sprung",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBRequireVar,
        Params = {
          RequiredVar = "MineDamageAmount",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetCanMove
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetGhosted
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetInvulnerable
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetTargetable
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetCanAttack
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "TeamID",
          DestVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Active",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HomingBeacon",
          DestVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Detonated",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SprungCount",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 10,
      OffsetAngle = 180,
      PositionVar = "Pos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Pos"}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Detonated",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "Owner",
              EffectName = "maoki_sapling_detonate.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "Owner",
              EffectName = "maoki_sapling_detonate.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 275,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "MineDamageAmount",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.6,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 4000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
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
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Active",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Sprung",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetStatus,
                Params = {
                  TargetVar = "Owner",
                  SrcValue = true,
                  Status = SetCanMove
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Other1",
                  SrcVar = "HomingBeacon",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "SprungCount",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "SprungCount",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "SprungCount",
                  Src1VarTable = "InstanceVars",
                  Value2 = 11,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Detonated",
                      Src1VarTable = "InstanceVars",
                      Value2 = false,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "Detonated",
                          DestVarTable = "InstanceVars",
                          SrcValue = true
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "TeamID",
                          Value2 = TEAM_ORDER,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Nothing",
                              PosVar = "Owner",
                              EffectName = "maoki_sapling_detonate.troy",
                              Flags = 0,
                              EffectIDVar = "Particle",
                              TargetObjectVar = "Owner",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_ORDER,
                              FOWVisibilityRadius = 200,
                              SendIfOnScreenOrDiscard = true
                            }
                          }
                        }
                      },
                      {
                        Function = BBElse,
                        Params = {},
                        SubBlocks = {
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Nothing",
                              PosVar = "Owner",
                              EffectName = "maoki_sapling_detonate.troy",
                              Flags = 0,
                              EffectIDVar = "Particle",
                              TargetObjectVar = "Owner",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_CHAOS,
                              FOWVisibilityRadius = 200,
                              SendIfOnScreenOrDiscard = true
                            }
                          }
                        }
                      },
                      {
                        Function = BBForEachUnitInTargetArea,
                        Params = {
                          AttackerVar = "Attacker",
                          CenterVar = "Owner",
                          Range = 275,
                          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                          IteratorVar = "Unit",
                          InclusiveBuffFilter = true
                        },
                        SubBlocks = {
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "MineDamageAmount",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.6,
                              PhysicalDamageRatio = 1,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffRemoveCurrent,
                    Params = {TargetVar = "Owner"}
                  },
                  {
                    Function = BBBreakExecution,
                    Params = {}
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
                      Src1Var = "SprungCount",
                      Src1VarTable = "InstanceVars",
                      Value2 = 2,
                      CompareOp = CO_GREATER_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIssueOrder,
                        Params = {
                          WhomToOrderVar = "Owner",
                          TargetOfOrderVar = "Other1",
                          Order = AI_MOVETO
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "SprungCount",
                          Src1VarTable = "InstanceVars",
                          Value2 = 2,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBPlayAnimation,
                            Params = {
                              AnimationName = "Run",
                              ScaleTime = 0,
                              TargetVar = "Owner",
                              Loop = false,
                              Blend = false,
                              Lock = false
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    Function = BBForNClosestUnitsInTargetArea,
                    Params = {
                      AttackerVar = "Owner",
                      CenterVar = "Owner",
                      Range = 200,
                      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                      IteratorVar = "Unit",
                      MaximumUnitsToPick = 10,
                      InclusiveBuffFilter = true
                    },
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
                            Function = BBIf,
                            Params = {
                              Src1Var = "Detonated",
                              Src1VarTable = "InstanceVars",
                              Value2 = false,
                              CompareOp = CO_EQUAL
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellBuffRemove,
                                Params = {
                                  TargetVar = "Owner",
                                  AttackerVar = "Owner",
                                  BuffName = "MaokaiSapling2"
                                }
                              },
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "Detonated",
                                  DestVarTable = "InstanceVars",
                                  SrcValue = true
                                }
                              },
                              {
                                Function = BBIf,
                                Params = {
                                  Src1Var = "TeamID",
                                  Value2 = TEAM_ORDER,
                                  CompareOp = CO_EQUAL
                                },
                                SubBlocks = {
                                  {
                                    Function = BBSpellEffectCreate,
                                    Params = {
                                      BindObjectVar = "Nothing",
                                      PosVar = "Owner",
                                      EffectName = "maoki_sapling_detonate.troy",
                                      Flags = 0,
                                      EffectIDVar = "Particle",
                                      TargetObjectVar = "Owner",
                                      SpecificUnitOnlyVar = "Owner",
                                      SpecificTeamOnly = TEAM_UNKNOWN,
                                      UseSpecificUnit = false,
                                      FOWTeam = TEAM_ORDER,
                                      FOWVisibilityRadius = 200,
                                      SendIfOnScreenOrDiscard = true
                                    }
                                  }
                                }
                              },
                              {
                                Function = BBElse,
                                Params = {},
                                SubBlocks = {
                                  {
                                    Function = BBSpellEffectCreate,
                                    Params = {
                                      BindObjectVar = "Nothing",
                                      PosVar = "Owner",
                                      EffectName = "maoki_sapling_detonate.troy",
                                      Flags = 0,
                                      EffectIDVar = "Particle",
                                      TargetObjectVar = "Owner",
                                      SpecificUnitOnlyVar = "Owner",
                                      SpecificTeamOnly = TEAM_UNKNOWN,
                                      UseSpecificUnit = false,
                                      FOWTeam = TEAM_CHAOS,
                                      FOWVisibilityRadius = 200,
                                      SendIfOnScreenOrDiscard = true
                                    }
                                  }
                                }
                              },
                              {
                                Function = BBForEachUnitInTargetArea,
                                Params = {
                                  AttackerVar = "Attacker",
                                  CenterVar = "Owner",
                                  Range = 275,
                                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                                  IteratorVar = "Unit",
                                  InclusiveBuffFilter = true
                                },
                                SubBlocks = {
                                  {
                                    Function = BBBreakSpellShields,
                                    Params = {TargetVar = "Unit"}
                                  },
                                  {
                                    Function = BBApplyDamage,
                                    Params = {
                                      AttackerVar = "Attacker",
                                      CallForHelpAttackerVar = "Attacker",
                                      TargetVar = "Unit",
                                      Damage = 0,
                                      DamageVar = "MineDamageAmount",
                                      DamageVarTable = "InstanceVars",
                                      DamageType = MAGIC_DAMAGE,
                                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                                      PercentOfAttack = 1,
                                      SpellDamageRatio = 0.6,
                                      PhysicalDamageRatio = 1,
                                      IgnoreDamageIncreaseMods = false,
                                      IgnoreDamageCrit = false
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
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 550,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 8,
                  InclusiveBuffFilter = true
                },
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
                        Function = BBIf,
                        Params = {
                          Src1Var = "Sprung",
                          Src1VarTable = "InstanceVars",
                          Value2 = false,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBGetTeamID,
                            Params = {TargetVar = "Unit", DestVar = "UnitTeam"}
                          },
                          {
                            Function = BBAddUnitPerceptionBubble,
                            Params = {
                              TeamVar = "UnitTeam",
                              Radius = 10,
                              TargetVar = "Owner",
                              Duration = 2.5,
                              SpecificUnitsClientOnlyVar = "Nothing",
                              RevealSpecificUnitOnlyVar = "Owner",
                              RevealSteath = false,
                              BubbleIDVar = "PerceptionBubble",
                              BubbleIDVarTable = "InstanceVars"
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "Sprung",
                              DestVarTable = "InstanceVars",
                              SrcValue = true
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "SprungCount",
                              DestVarTable = "InstanceVars",
                              SrcValue = 0
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "HomingBeacon",
                              DestVarTable = "InstanceVars",
                              SrcVar = "Unit"
                            }
                          },
                          {
                            Function = BBFaceDirection,
                            Params = {TargetVar = "Owner", LocationVar = "Unit"}
                          },
                          {
                            Function = BBOverrideAnimation,
                            Params = {
                              ToOverrideAnim = "Idle1",
                              OverrideAnim = "Pop",
                              OwnerVar = "Owner"
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Owner",
                              BuffName = "MaokaiSapling2",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_CombatEnchancer,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 25000,
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
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "SprungCount",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "SprungCount",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "SprungCount",
              Src1VarTable = "InstanceVars",
              Value2 = 2,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SprungCount",
                  DestVarTable = "InstanceVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Active",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TeamID",
                  Src1VarTable = "InstanceVars",
                  Value2 = TEAM_ORDER,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_rdy_indicator_green.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "BUFFBONE_CSTM_STEM_3",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_ORDER,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_rdy_indicator_red.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "BUFFBONE_CSTM_STEM_3",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_CHAOS,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_team_id_green.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_ORDER,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_team_id_red.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_CHAOS,
                      UseSpecificUnit = true,
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
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_rdy_indicator_green.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "BUFFBONE_CSTM_STEM_3",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_CHAOS,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_rdy_indicator_red.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "BUFFBONE_CSTM_STEM_3",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_ORDER,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_team_id_green.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_CHAOS,
                      UseSpecificUnit = true,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "maokai_sapling_team_id_red.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_ORDER,
                      UseSpecificUnit = true,
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_sapling_detonate.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapling2"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_rdy_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_rdy_indicator_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_sapling_team_id_red.troy"
    }
  }
}
