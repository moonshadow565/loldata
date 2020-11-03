NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Katarina_Voracity.dds"
BuffName = "OrianaSpellSword"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDamage",
          SrcValueByLevel = {
            5,
            5,
            5,
            10,
            10,
            10,
            15,
            15,
            15,
            20,
            20,
            20,
            25,
            25,
            25,
            30,
            30,
            30,
            35,
            35,
            35
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "BaseDamage",
          Index = 2
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDamage",
          SrcValueByLevel = {
            5,
            5,
            5,
            10,
            10,
            10,
            15,
            15,
            15,
            20,
            20,
            20,
            25,
            25,
            25,
            30,
            30,
            30,
            35,
            35,
            35
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "APBonus"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APBonus",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "Damage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseDamage",
          Src2Var = "Damage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Damage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "Damage",
          Index = 3
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "CastSlot", Info = GetSpellSlot}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CastSlot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Deployed", SrcValue = false}
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 25000,
          Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf AffectUntargetable ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "OrianaGhost",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Deployed", SrcValue = true}
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBGetStatus,
                Params = {
                  TargetVar = "Owner",
                  DestVar = "IsStealth",
                  Status = GetStealthed
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "IsStealth",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      PosVar = "TargetPos",
                      EffectName = "OrianaVacuumIndicator_ally.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "spinnigtopridge",
                      TargetObjectVar = "Nothing",
                      TargetPosVar = "TargetPos",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "UltimateType",
                      DestVarTable = "CharVars",
                      SrcValue = 0
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "UltimateTargetPos",
                      DestVarTable = "CharVars",
                      SrcVar = "TargetPos"
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
                      PosVar = "TargetPos",
                      EffectName = "OrianaVacuumIndicatorSelfNoRing.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "root",
                      TargetObjectVar = "Nothing",
                      TargetPosVar = "TargetPos",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Nothing",
                      PosVar = "TargetPos",
                      EffectName = "OrianaVacuumIndicatorSelfRing.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "root",
                      TargetObjectVar = "Nothing",
                      TargetPosVar = "TargetPos",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "UltimateType",
                      DestVarTable = "CharVars",
                      SrcValue = 1
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "UltimateTargetPos",
                      DestVarTable = "CharVars",
                      SrcVar = "TargetPos"
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  PosVar = "TargetPos",
                  EffectName = "OrianaVacuumIndicator.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "spinnigtopridge",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateType",
                  DestVarTable = "CharVars",
                  SrcValue = 1
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateTargetPos",
                  DestVarTable = "CharVars",
                  SrcVar = "TargetPos"
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Deployed",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Nothing",
              BuffName = "OriannaBallTracker"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TargetPos",
                  SrcVar = "BallPosition",
                  SrcVarTable = "CharVars"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaVacuumIndicatorSelfNoRing.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "root",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaVacuumIndicatorSelfRing.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "root",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateType",
                  DestVarTable = "CharVars",
                  SrcValue = 5
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateTargetPos",
                  DestVarTable = "CharVars",
                  SrcVar = "TargetPos"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBGetPointByUnitFacingOffset,
                Params = {
                  UnitVar = "Owner",
                  Distance = 0,
                  OffsetAngle = 0,
                  PositionVar = "TargetPos"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  PosVar = "TargetPos",
                  EffectName = "OrianaVacuumIndicatorSelfNoRing.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "spinnigtopridge",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaVacuumIndicatorSelfRing.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "root",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateType",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "UltimateTargetPos",
                  DestVarTable = "CharVars",
                  SrcVar = "TargetPos"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Nothing",
          BuffName = "OrianaGhost"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "OrianaGhost"
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APBonus"
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        5,
        5,
        5,
        10,
        10,
        10,
        15,
        15,
        15,
        20,
        20,
        20,
        25,
        25,
        25,
        30,
        30,
        30,
        35,
        35,
        35
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "APBonus",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "Damage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "Damage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      CasterVar = "Owner",
      BuffName = "OrianaPowerDagger"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src1Value = 0.15,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "Damage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Target",
              CasterVar = "Owner",
              BuffName = "OrianaPowerDagger"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OrianaPowerDaggerDisplay"
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "OrianaPowerDagger",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 3,
              NumberOfStacks = 1,
              Duration = 4,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Target",
              Range = 25000,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              BuffNameFilter = "OrianaPowerDagger",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Target",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffClear,
                    Params = {
                      TargetVar = "Unit",
                      BuffName = "OrianaPowerDagger"
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OrianaPowerDaggerDisplay",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 3,
              NumberOfStacks = 1,
              Duration = 4,
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
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "Damage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicator_ally.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicatorselfnoring.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicatorselfring.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oriannaballtracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianapowerdagger"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianapowerdaggerdisplay"
    }
  }
}
