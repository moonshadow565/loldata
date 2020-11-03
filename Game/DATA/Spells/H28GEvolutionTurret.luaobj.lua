NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Heimerdinger_H28GEvolutionTurret.dds"
BuffName = "H28GEvolutionTurret"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "ScriptName",
          Value2 = "globalwallpush",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
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
          Src1Var = "MaxStack",
          Value2 = 76,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusArmor",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusStats",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "heimerdinger_turret_birth.troy",
      Flags = 0,
      EffectIDVar = "poofin",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Owner",
      Range = 425,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes AffectTurrets ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Unit",
              BuffName = "H28GEvolutionTurretSpell2",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Unit",
              BuffName = "H28GEvolutionTurretSpell3",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "HeimerdingerTurretMaximum"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "HeimerdingerTurretMaximum",
          ResetDuration = 0
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusDamage",
      DeltaVarTable = "InstanceVars",
      Delta = 0
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
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "BonusStats",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "BonusStats",
      DeltaVarTable = "InstanceVars",
      Delta = 0
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
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Nothing",
          BuffName = "H28GEvolutionTurretSpell1"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Nothing",
              BuffName = "H28GEvolutionTurretSpell2"
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Nothing",
                  BuffName = "H28GEvolutionTurretSpell3"
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "unitFound", SrcValue = 0}
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Nothing",
                      BuffName = "UpgradeSlow"
                    },
                    SubBlocks = {
                      {
                        Function = BBForNClosestUnitsInTargetArea,
                        Params = {
                          AttackerVar = "Attacker",
                          CenterVar = "Owner",
                          Range = 425,
                          Flags = "AffectEnemies AffectHeroes ",
                          IteratorVar = "Unit",
                          MaximumUnitsToPick = 1,
                          InclusiveBuffFilter = true
                        },
                        SubBlocks = {
                          {
                            Function = BBSetVarInTable,
                            Params = {DestVar = "unitFound", SrcValue = 1}
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Unit",
                              BuffName = "H28GEvolutionTurretSpell2",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "unitFound",
                      Value2 = 0,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBForNClosestUnitsInTargetArea,
                        Params = {
                          AttackerVar = "Attacker",
                          CenterVar = "Owner",
                          Range = 425,
                          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes AffectTurrets ",
                          IteratorVar = "Unit",
                          MaximumUnitsToPick = 1,
                          InclusiveBuffFilter = true
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Owner",
                                  AttackerVar = "Unit",
                                  BuffName = "H28GEvolutionTurretSpell2",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Internal,
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
                          },
                          {
                            Function = BBElse,
                            Params = {},
                            SubBlocks = {
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Owner",
                                  AttackerVar = "Unit",
                                  BuffName = "H28GEvolutionTurretSpell3",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Internal,
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
                      BuffName = "UpgradeSlow"
                    },
                    SubBlocks = {
                      {
                        Function = BBForNClosestUnitsInTargetArea,
                        Params = {
                          AttackerVar = "Attacker",
                          CenterVar = "Owner",
                          Range = 425,
                          Flags = "AffectEnemies AffectHeroes ",
                          IteratorVar = "Unit",
                          MaximumUnitsToPick = 1,
                          InclusiveBuffFilter = true
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellBuffClear,
                            Params = {
                              TargetVar = "Owner",
                              BuffName = "H28GEvolutionTurretSpell3"
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Unit",
                              BuffName = "H28GEvolutionTurretSpell2",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Internal,
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
      }
    }
  }
}
BuffOnSpellHitBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusArmor",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.143,
      DestVar = "BonusArmor",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "HeimerdingerTurretReady"
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "HeimerdingerTurretReady",
      ResetDuration = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxStacks",
      SrcValueByLevel = {
        1,
        1,
        2,
        2,
        2
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level4BonusHP",
      SrcValueByLevel = {
        0,
        0,
        0,
        125,
        125
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "NumFound", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "minDuration",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetUnit,
    Params = {SrcVar = "Owner", DestVar = "Other2"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions ",
      IteratorVar = "Unit",
      BuffNameFilter = "H28GEvolutionTurret",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "NumFound",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "NumFound",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "durationRemaining",
          TargetVar = "Unit",
          BuffName = "H28GEvolutionTurret"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "durationRemaining",
          Src2Var = "minDuration",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "minDuration",
              SrcVar = "durationRemaining"
            }
          },
          {
            Function = BBInvalidateUnit,
            Params = {TargetVar = "Other2"}
          },
          {
            Function = BBSetUnit,
            Params = {SrcVar = "Unit", DestVar = "Other2"}
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "NumFound",
      Src2Var = "MaxStacks",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Other2",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Other2",
              CallForHelpAttackerVar = "Other2",
              TargetVar = "Other2",
              Damage = 10000,
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_INTERNALRAW,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        30,
        38,
        46,
        54,
        62
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "AbilityPowerBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcVar = "BonusDamage"
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 15,
      DestVar = "BonusHealthPreLevel4",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusHealthPreLevel4",
      Src1VarTable = "NextBuffVars",
      Src2Var = "Level4BonusHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "BonusStats",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusArmor",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        0,
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UpgradeBuff"
    },
    SubBlocks = {
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "H-28G Evolution Turret",
          Skin = "HeimerTBlue",
          AiScript = "Minion.lua",
          PosVar = "TargetPos",
          Team = TEAM_UNKNOWN,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = false,
          Silenced = true,
          Invulnerable = false,
          MagicImmune = false,
          IgnoreCollision = false,
          IsWard = false,
          Placemarker = false,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "remainingDuration",
          TargetVar = "Owner",
          BuffName = "UpgradeBuff"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Attacker",
          BuffName = "UpgradeSlow",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "remainingDuration",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 5,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "UpgradeBuff"
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "H-28G Evolution Turret",
              Skin = "HeimerTRed",
              AiScript = "Minion.lua",
              PosVar = "TargetPos",
              Team = TEAM_UNKNOWN,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = false,
              Silenced = true,
              Invulnerable = false,
              MagicImmune = false,
              IgnoreCollision = false,
              IsWard = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "ExplosiveCartridges",
          BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 2,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "UpgradeBuff"
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "H-28G Evolution Turret",
              Skin = "HeimerTGreen",
              AiScript = "Minion.lua",
              PosVar = "TargetPos",
              Team = TEAM_UNKNOWN,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = false,
              Silenced = true,
              Invulnerable = false,
              MagicImmune = false,
              IgnoreCollision = false,
              IsWard = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "UrAniumRounds",
          BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "UpgradeBuff"
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "H-28G Evolution Turret",
              Skin = "HeimerTYellow",
              AiScript = "Minion.lua",
              PosVar = "TargetPos",
              Team = TEAM_UNKNOWN,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = false,
              Silenced = true,
              Invulnerable = false,
              MagicImmune = false,
              IgnoreCollision = false,
              IsWard = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffName = "UPGRADE!!!Proof",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_turret_birth.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell3"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertblue"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgradeslow"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "heimertred"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosivecartridges"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertgreen"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumrounds"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertyellow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgrade!!!proof"
    }
  }
}
