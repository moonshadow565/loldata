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
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
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
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
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
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 575,
          Flags = "AffectEnemies AffectNeutral AffectBuildings AffectMinions AffectHeroes AffectTurrets ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Unit", DestVar = "teamID"}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "teamID",
              Value2 = TEAM_NEUTRAL,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Unit",
                  TargetVar = "Owner",
                  Duration = 0.5
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIssueOrder,
                Params = {
                  WhomToOrderVar = "Owner",
                  TargetOfOrderVar = "Unit",
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
BuffOnSpellHitBuildingBlocks = {
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
            Function = BBMath,
            Params = {
              Src1Var = "BonusDamage",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.143,
              DestVar = "BonusDamage",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
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
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxStacks",
      SrcValueByLevel = {
        1,
        2,
        2,
        3,
        3
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "NumFound", SrcValue = 0}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "H28GEvolutionTurret"
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LowestLevel",
          SrcValue = 4
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level1",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level2",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level3",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level4",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level5",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level6",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowestLevel",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "LowestTime", SrcValue = 25000}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level1",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time1",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level2",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time2",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level3",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time3",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level4",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time4",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level5",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time5",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level6",
          Src1VarTable = "CharVars",
          Src2Var = "LowestLevel",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Time6",
              Src1VarTable = "CharVars",
              Src2Var = "LowestTime",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "LowestTime",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "LowestTime",
          Src2Var = "Time1",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerOne"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "LowestTime",
          Src2Var = "Time2",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerTwo"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "LowestTime",
          Src2Var = "Time3",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerThree"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "LowestTime",
          Src2Var = "Time4",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerFour"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "LowestTime",
          Src2Var = "Time5",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerFive"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 25000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "MarkerSix"
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Unit",
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
      Src2Value = 0.25,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        28,
        36,
        44,
        52,
        60
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
      Src2Value = 21,
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 3,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "H-28G Evolution Turret",
          Skin = "H28GEvolutionTurret",
          AiScript = "Minion.lua",
          PosVar = "TargetPos",
          Team = TEAM_CASTER,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = false,
          Silenced = true,
          Invulnerable = false,
          MagicImmune = false,
          IgnoreCollision = false,
          Placemarker = false,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "H-28G Evolution Turret",
              Skin = "H28Green",
              AiScript = "Minion.lua",
              PosVar = "TargetPos",
              Team = TEAM_CASTER,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = false,
              Silenced = true,
              Invulnerable = false,
              MagicImmune = false,
              IgnoreCollision = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
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
            Function = BBSpawnMinion,
            Params = {
              Name = "H-28G Evolution Turret",
              Skin = "H28Red",
              AiScript = "Minion.lua",
              PosVar = "TargetPos",
              Team = TEAM_CASTER,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = false,
              Silenced = true,
              Invulnerable = false,
              MagicImmune = false,
              IgnoreCollision = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
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
              CanMitigateDuration = false
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
      CanMitigateDuration = false
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
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "1Found", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "2Found", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "3Found", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "4Found", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "5Found", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "6Found", SrcValue = 0}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "H28GEvolutionTurret"
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerOne"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "1Found", SrcValue = 1}
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerTwo"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "2Found", SrcValue = 1}
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerThree"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "3Found", SrcValue = 1}
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerFour"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "4Found", SrcValue = 1}
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerFive"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "5Found", SrcValue = 1}
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MarkerSix"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "6Found", SrcValue = 1}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "1Found",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time1", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level1",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerOne",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 6,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "2Found",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time2", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level2",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerTwo",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "3Found",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time3", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level3",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerThree",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "4Found",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time4", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level4",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerFour",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "5Found",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time5", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level5",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerFive",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
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
        Function = BBGetGameTime,
        Params = {SecondsVar = "Time6", SecondsVarTable = "CharVars"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level6",
          DestVarTable = "CharVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "MarkerSix",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
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
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerone"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markertwo"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "markerthree"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerfour"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerfive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markersix"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "h28green"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumrounds"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "h28red"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosivecartridges"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgrade!!!proof"
    }
  }
}
