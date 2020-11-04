NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillMove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StunDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "SlashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UnstoppableForce_cas.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars",
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBStopCurrentOverrideAnimation,
    Params = {AnimationName = "RunUlt", TargetVar = "Owner"}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillMove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "RunUlt",
          ScaleTime = 0,
          TargetVar = "Owner",
          Loop = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillMove",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthCost",
          SrcValueByLevel = {
            30,
            60,
            90,
            120,
            150
          }
        }
      },
      {
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Owner",
          Function = GetHealth
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Temp1",
          Src2Var = "HealthCost",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
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
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "HealthCost",
          Src2Var = "Temp1",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Temp1",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "HealthCost",
              MathOp = MO_SUBTRACT
            }
          }
        }
      },
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Owner",
          DestVar = "CanMove",
          Status = GetCanMove
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanMove",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        200,
        300,
        400,
        270,
        330
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 1000,
      DestVar = "SlashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src2Var = "SlashSpeed",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Duration",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SlashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "SlashSpeed"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StunDuration",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        1.5,
        2,
        2.5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0.05,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Attack3",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StunDuration",
      DestVarTable = "NextBuffVars",
      SrcVar = "StunDuration",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UnstoppableForce_tar.troy",
      Flags = 0,
      EffectIDVar = "TargetParticle",
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 300,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "Damage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "UnstoppableForceStun",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "unstoppableforce_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "unstoppableforce_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcestun"
    }
  }
}
