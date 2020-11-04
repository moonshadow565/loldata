NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "ViktorChaosStorm.dds"
BuffName = "ViktorStormGuide"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
SpellDamageRatio = 0.5
IsPetDurationBuff = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Viktor_ChaosStorm_indicator.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Caster",
      SpecificTeamOnly = TEAM_CASTER,
      UseSpecificUnit = false,
      FOWTeam = TEAM_CASTER,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Viktor_ChaosStorm_indicator_02.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Caster",
      SpecificTeamOnly = TEAM_CASTER,
      UseSpecificUnit = false,
      FOWTeam = TEAM_CASTER,
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
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
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
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "OwnerPos",
          Range = 25000,
          Flags = "AffectEnemies AffectFriends AffectMinions AffectUntargetable ",
          IteratorVar = "Unit",
          BuffNameFilter = "ViktorChaosStormAOE",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBDistanceBetweenObjects,
            Params = {
              DestVar = "Distance",
              ObjectVar1 = "Unit",
              ObjectVar2 = "Owner"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Caster",
              Src2Var = "Unit",
              CompareOp = CO_SAME_TEAM
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBIssueOrder,
                    Params = {
                      WhomToOrderVar = "Unit",
                      TargetOfOrderVar = "Owner",
                      Order = AI_MOVETO
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
                      WhomToOrderVar = "Unit",
                      TargetOfOrderVar = "Owner",
                      Order = AI_MOVETO
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetBuffStartTime,
    Params = {
      DestVar = "HMCSStartTime",
      TargetVar = "Owner",
      BuffName = "ViktorChaosStormGuide"
    }
  },
  {
    Function = BBGetTime,
    Params = {
      DestVar = "HMCSCurrTime"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HMCSCurrTime",
      Src2Var = "HMCSStartTime",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "RemainingBuffTime",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "HasTarget", SrcValue = false}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "CenterPos"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "CenterPos",
      Range = 25000,
      Flags = "AffectEnemies AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
      IteratorVar = "Unit",
      BuffNameFilter = "ViktorChaosStormGuide",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "ViktorChaosStormGuide"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "ViktorChaosStormGuide",
                  ResetDuration = 0
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetStatus,
                Params = {
                  TargetVar = "Unit",
                  SrcValue = false,
                  Status = SetInvulnerable
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Unit",
                  CallForHelpAttackerVar = "Unit",
                  TargetVar = "Unit",
                  Damage = 25000,
                  DamageType = TRUE_DAMAGE,
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
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 150,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "ViktorChaosStormGuide",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HasTarget", SrcValue = true}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasTarget",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "GuideMarker",
          Skin = "TestCube",
          PosVar = "TargetPos",
          Team = TEAM_UNKNOWN,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = false,
          IgnoreCollision = true,
          IsWard = false,
          Placemarker = false,
          VisibilitySize = 0,
          DestVar = "Other2",
          GoldRedirectTargetVar = "Nothing"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Attacker",
          BuffName = "ViktorExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Attacker",
          BuffName = "ViktorChaosStormGuide",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "RemainingBuffTime",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstormguide"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorexpirationtimer"
    }
  }
}
