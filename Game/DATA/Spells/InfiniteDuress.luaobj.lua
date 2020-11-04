NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 2.23
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "Infinite Duress"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "NumHitsRemaining",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Attacker",
          DestVar = "TotalAttackDamage"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalAttackDamage",
          Src1Value = 0,
          Src2Value = 0.33,
          DestVar = "DamageToDeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageToDeal",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDeal",
          MathOp = MO_ADD
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
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "DamageToDeal",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 0
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "NumHitsRemaining",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "NumHitsRemaining",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "NumHitsRemaining",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Attacker",
              StopCondition = ChannelingStopCondition_Success,
              StopSource = ChannelingStopSource_TimeCompleted
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Attacker",
          StopCondition = ChannelingStopCondition_Success,
          StopSource = ChannelingStopSource_Die
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBGetRandomPointInAreaUnit,
    Params = {
      TargetVar = "Target",
      Radius = 150,
      InnerRadius = 150,
      ResultVar = "Pos"
    }
  },
  {
    Function = BBTeleportToPosition,
    Params = {OwnerVar = "Owner", CastPositionName = "Pos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NumHitsRemaining",
      DestVarTable = "NextBuffVars",
      SrcValue = 6
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        50,
        70
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressHold",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 2.23,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 2.23
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "InfiniteDuress"
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressHold"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "InfiniteDuress"
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "InfiniteDuressHold"
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
      Name = "infiniteduresshold"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduress"
    }
  }
}
