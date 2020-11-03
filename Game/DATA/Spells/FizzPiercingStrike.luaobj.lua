NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "XenZhao_CrescentSweepNew.dds"
BuffName = "XenZhaoSweep"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageDealt",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "OwnerPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Fizz_PiercingStrike.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HitTarget",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = -175
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = 0
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitTarget",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 175,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Attacker"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
              TargetVar = "Attacker",
              Damage = 0,
              DamageVar = "DamageDealt",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.7,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBGetTotalAttackDamage,
            Params = {TargetVar = "Owner", DestVar = "TotalAD"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
              TargetVar = "Attacker",
              Damage = 0,
              DamageVar = "TotalAD",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HitTarget",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "Fizz_PiercingStrike_tar.troy",
              Flags = 0,
              EffectIDVar = "targetParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Attacker",
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
          }
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = -175
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OkayCheckDistance",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CheckDistance",
      SrcValue = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Distance",
      Src1Value = 600,
      Src2Value = 0,
      DestVar = "LeapDistance",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBWhile,
    Params = {
      Src1Var = "CheckDistance",
      Src2Var = "LeapDistance",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "CheckDistance",
          Src2Var = "Distance",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DoubleCheckDistance",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "DoubleCheckDistance",
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      },
      {
        Function = BBIsPathable,
        Params = {DestPosVar = "TargetPos", ResultVar = "Result"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Result",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CheckDistance",
              Src1Value = 0,
              Src2Value = 601,
              DestVar = "CheckDistance",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "OkayCheckDistance",
              SrcVar = "CheckDistance",
              SrcValue = 0
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CheckDistance",
          Src1Value = 0,
          Src2Value = 25,
          DestVar = "CheckDistance",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src2Var = "OkayCheckDistance",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Distance",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "Distance",
      OffsetAngle = 0,
      PositionVar = "TargetPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageDealt",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        10,
        40,
        70,
        100,
        130
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OwnerPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "OwnerPos"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 1450,
      Gravity = 0,
      MoveBackBy = 25,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "Distance"
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell1",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = false,
      Lock = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Target",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIssueOrder,
        Params = {
          WhomToOrderVar = "Owner",
          TargetOfOrderVar = "Target",
          Order = AI_ATTACKTO
        }
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzPiercingStrike"
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 275,
      OffsetAngle = 0,
      PositionVar = "TargetPos"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzPiercingStrike"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitTarget",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Caster"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Caster",
          Damage = 0,
          DamageVar = "DamageDealt",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.7,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {TargetVar = "Owner", DestVar = "TotalAD"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Caster",
          Damage = 0,
          DamageVar = "TotalAD",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "Fizz_PiercingStrike_tar.troy",
          Flags = 0,
          EffectIDVar = "targetParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Attacker",
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
      }
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = false}
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnMoveFailureBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzPiercingStrike"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_piercingstrike.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_piercingstrike_tar.troy"
    }
  }
}
