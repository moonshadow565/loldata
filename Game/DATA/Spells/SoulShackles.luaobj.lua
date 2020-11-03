NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_Purgatory.dds"
BuffName = "Soul Shackles"
AutoBuffActivateEffect = "SoulShackle_buf.troy"
AutoBuffActivateEffect2 = "SoulShackle_tar.troy"
AutoCooldownByLevel = {
  80,
  80,
  80
}
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakStun",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Broken",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "SoulShackle_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
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
      SecondsVar = "ActivateTime",
      SecondsVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Broken",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {
          SecondsVar = "DeactivateTime"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DeactivateTime",
          Src2Var = "ActivateTime",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TimeElapsed",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TimeElapsed",
          Value2 = 3,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "BreakDamage",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.8,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 0,
              DurationVar = "BreakStun",
              DurationVarTable = "InstanceVars"
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
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "SoulShacklesOwner"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Broken",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Broken",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "SoulShackleSlow",
              ResetDuration = 0
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Broken",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "SoulShackleSlow",
                  ResetDuration = 0
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Owner",
                  ObjectVar2 = "Attacker"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Distance",
                  Value2 = 600,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "Broken",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Attacker",
                      BuffName = "SoulShackleSlow",
                      ResetDuration = 0
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
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 600,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SoulShacklesOwner",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        175,
        250,
        325
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakStun",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        1.5,
        1.5,
        1.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Broken",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "SoulShackles",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BreakDamage",
      DamageVarTable = "NextBuffVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.8,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.2
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshacklesowner"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshackles"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
