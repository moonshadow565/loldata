NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "BlindMonkR.dds"
BuffName = "BlindMonkDragonsRage"
AutoBuffActivateEffect = "blindMonk_R_self_mis.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SecondaryDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TarPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TarPos",
      SrcVar = "TarPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Target",
      TargetVar = "TarPos",
      Speed = 1000,
      Gravity = 5,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 800
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
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Owner",
      Range = 160,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Owner",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Unit",
              BuffName = "BlindMonkRMarker"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "BlindMonkRMarker",
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
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Owner", DestVar = "TeamID"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "blind_monk_ult_unit_impact.troy",
                  Flags = 0,
                  EffectIDVar = "PH",
                  TargetObjectVar = "Unit",
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
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "SecondaryDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = true
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "BlindMonkRDamage",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              }
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        200,
        400,
        600,
        600,
        600
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "BonusAD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusAD",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "BonusAD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PrimaryDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PrimaryDamage",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "SecondaryDamage",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SecondaryDamage",
      DestVarTable = "NextBuffVars",
      SrcVar = "SecondaryDamage"
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "DistanceToAdd",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DistanceToAdd",
      Src1Value = 0,
      Src2Value = 800,
      DestVar = "DistanceToKick",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "DistanceToKick",
      OffsetAngle = 0,
      PositionVar = "TarPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TarPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TarPos"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Stun,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
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
      DamageVar = "PrimaryDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkrmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blind_monk_ult_unit_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkrdamage"
    }
  }
}
