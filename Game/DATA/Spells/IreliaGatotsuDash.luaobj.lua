BuffTextureName = "Irelia_Bladesurge.dds"
BuffName = "IreliaGatotsuDash"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "dashSpeed",
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
      RequiredVar = "Distance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageVar",
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
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 150,
      DestVar = "DistanceCheck",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "DistanceCheck",
      OffsetAngle = 0,
      PositionVar = "PathablePoint"
    }
  },
  {
    Function = BBIsPathable,
    Params = {
      DestPosVar = "PathablePoint",
      ResultVar = "PathableVar"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PathableVar",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "TargetPos",
          Speed = 0,
          SpeedVar = "dashSpeed",
          SpeedVarTable = "InstanceVars",
          Gravity = 0,
          MoveBackBy = 150,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = CANCEL_ORDER,
          IdealDistance = 0,
          IdealDistanceVar = "Distance",
          IdealDistanceVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "TargetPos",
          Speed = 0,
          SpeedVar = "dashSpeed",
          SpeedVarTable = "InstanceVars",
          Gravity = 0,
          MoveBackBy = 1,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = CANCEL_ORDER,
          IdealDistance = 0,
          IdealDistanceVar = "Distance",
          IdealDistanceVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "irelia_gotasu_dash_02.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "spell1",
      ScaleTime = 0.5,
      TargetVar = "Owner",
      Loop = false,
      Blend = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Caster", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Caster",
          BuffName = "IreliaGatotsu",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Caster"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "IreliaGatotsuDashParticle",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Caster",
      Damage = 0,
      DamageVar = "DamageVar",
      DamageVarTable = "InstanceVars",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "IreliaGatotsuDash"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_gotasu_dash_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliagatotsu"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliagatotsudashparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliagatotsudash"
    }
  }
}
