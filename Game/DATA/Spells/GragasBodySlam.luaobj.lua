NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GragasBodySlam.dds"
BuffName = "GragasBodySlam"
BuffOnCollisionBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_DEAD},
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Target",
                  CasterVar = "Nothing",
                  BuffName = "SharedWardBuff"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "GragasBodySlamHolder",
                      ResetDuration = 0
                    }
                  },
                  {
                    Function = BBStopMoveBlock,
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
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell1",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DashSpeed",
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
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MinimumDamage",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "gragas_bodySlam_cas.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
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
    Function = BBMove,
    Params = {
      UnitVar = "Target",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "DashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "Distance",
      IdealDistanceVarTable = "InstanceVars"
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
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
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
      Value2 = 600,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 600}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 600,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DashSpeed",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        650,
        750,
        800,
        950,
        1050
      }
    }
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
      DestVar = "Distance",
      DestVarTable = "NextBuffVars",
      SrcVar = "Distance"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        80,
        120,
        160,
        200,
        240
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MinimumDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        50,
        75,
        100,
        125,
        150
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "GragasBodySlam",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.1,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "gragas_bodySlam_cas_02.troy",
      Flags = 0,
      TargetObjectVar = "Target",
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "GragasBodySlamHolder",
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
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasBodySlam",
      ResetDuration = 0
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "gragas_bodySlam_cas_03.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Target",
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
    Params = {DestVar = "NumUnits", SrcValue = 0}
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "AttackDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackDamage",
      Src1Value = 0,
      Src2Value = 0.66,
      DestVar = "AttackDamageMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackDamageMod",
      Src2Var = "BonusDamage",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Attacker",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "NumUnits",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "NumUnits",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Attacker",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src2Var = "NumUnits",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDeal",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MinimumDamage",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageToDeal",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "gragas_bodySlam_unit_tar_02.troy",
              Flags = 10,
              EffectIDVar = "asdf1",
              BoneName = "C_BUFFBONE_GLB_CHEST_LOC",
              TargetObjectVar = "Unit",
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
              BindObjectVar = "Unit",
              EffectName = "gragas_bodySlam_unit_tar.troy",
              Flags = 10,
              EffectIDVar = "asdf2",
              TargetObjectVar = "Unit",
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
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "MinimumDamage",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.5,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "GragasBodySlamTargetSlow",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "gragas_bodySlam_unit_tar_02.troy",
              Flags = 10,
              EffectIDVar = "asdf1",
              BoneName = "C_BUFFBONE_GLB_CHEST_LOC",
              TargetObjectVar = "Unit",
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
              BindObjectVar = "Unit",
              EffectName = "gragas_bodySlam_unit_tar.troy",
              Flags = 10,
              EffectIDVar = "asdf2",
              TargetObjectVar = "Unit",
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
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageToDeal",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.5,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "GragasBodySlamTargetSlow",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sharedwardbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslam"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_unit_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamtargetslow"
    }
  }
}
