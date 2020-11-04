NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "tristana_rocketJump_cas.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Owner",
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
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
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 900,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 50}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1200}
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 900,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 900}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 600,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 50}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1200}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 500,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 80}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1200}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 400,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 100}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1100}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 300,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 120}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1025}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 200,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 150}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 975}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 100,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 300}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 800}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 1000}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 800}
      }
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "SpeedVar",
      Gravity = 0,
      GravityVar = "GravityVar",
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0,
      IdealDistanceVar = "Distance"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        70,
        115,
        160,
        205,
        250
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 300,
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
          AttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "Damage",
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AttackSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcVar = "MoveSpeedMod",
          SrcVarTable = "InstanceVars",
          SrcValue = -0.6
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "tristana_rocketJump_unit_tar.troy",
          Flags = 0,
          EffectIDVar = "b",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "RocketJumpSlow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "tristana_rocketJump_land.troy",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanCast",
      Status = GetCanCast
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanMove",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
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
      Src1Var = "CanCast",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_rocketjump_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_rocketjump_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rocketjumpslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_rocketjump_land.troy"
    }
  }
}
