NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "CastRange", SrcValue = 1640}
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
      Src2Var = "CastRange",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "CastRange",
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostAlive",
      DestVarTable = "NextBuffVars",
      SrcVar = "GhostAlive",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Deployed", SrcValue = false}
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "OrianaGhost",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Deployed", SrcValue = true}
      },
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
      },
      {
        Function = BBDistanceBetweenObjectAndPoint,
        Params = {
          DestVar = "Distance",
          ObjectVar = "Owner",
          PointVar = "TargetPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "CastRange",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "CastRange",
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          }
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Unit", PositionVar = "CastPos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CastPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "CastPos"
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
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "TargetPos",
          EndPosVar = "TargetPos",
          OverrideCastPosition = true,
          OverrideCastPosVar = "CastPos",
          SlotNumber = 5,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Deployed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "GhostAlive",
          Src1VarTable = "CharVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "CastPos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CastPos",
              DestVarTable = "NextBuffVars",
              SrcVar = "CastPos"
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
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Nothing",
              PosVar = "TargetPos",
              EndPosVar = "TargetPos",
              OverrideCastPosition = true,
              OverrideCastPosVar = "CastPos",
              SlotNumber = 5,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell2",
      ScaleTime = 1.25,
      TargetVar = "Owner",
      Loop = true,
      Blend = false,
      Lock = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UnlockAnimation",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OrianaGlobalCooldown",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "yomughost"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yomuglobalcooldown"
    }
  }
}
