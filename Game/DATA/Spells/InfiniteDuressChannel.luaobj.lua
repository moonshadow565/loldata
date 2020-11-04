NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
ChannelDuration = 2.1
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "Infinite Duress"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "hitsRemaining",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "damagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "InfiniteDuress_tar.troy",
      Flags = 0,
      EffectIDVar = "arr",
      TargetObjectVar = "Target",
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
    Function = BBIf,
    Params = {
      Src1Var = "Expired",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "hitsRemaining",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBWhile,
            Params = {
              Src1Var = "hitsRemaining",
              Src1VarTable = "InstanceVars",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "InfiniteDuress_tar.troy",
                  Flags = 0,
                  EffectIDVar = "arr",
                  TargetObjectVar = "Target",
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
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Damage = 0,
                  DamageVar = "damagePerTick",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_ATTACK,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "hitsRemaining",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "hitsRemaining",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_SUBTRACT
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
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Attacker",
          StopCondition = ChannelingStopCondition_Cancel,
          StopSource = ChannelingStopSource_LostTarget
        }
      }
    }
  },
  {
    Function = BBIssueOrder,
    Params = {
      WhomToOrderVar = "Owner",
      TargetOfOrderVar = "Target",
      Order = AI_ATTACKTO
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
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Attacker",
          BuffName = "Suppression"
        },
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Attacker",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "hitsRemaining",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "InfiniteDuress_tar.troy",
              Flags = 0,
              EffectIDVar = "arr",
              TargetObjectVar = "Target",
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
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "damagePerTick",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "hitsRemaining",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "hitsRemaining",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          }
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressSound",
      ResetDuration = 0
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressChannel",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressSound",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Suppression",
      ResetDuration = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "infiniteduress_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresssound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresschannel"
    }
  }
}
