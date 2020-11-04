NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "RivenBrokenWings.dds"
BuffName = "RivenTriCleaveBuff"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "RivenTriCleave"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Count",
      Index = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "RivenTriCleaveCooldown"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "RivenTriCleaveUnlock"
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Nothing",
      BuffName = "RivenTriCleave"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RivenTriCleave",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 3,
      NumberOfStacks = 1,
      Duration = 3.75,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CDReduction"
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseCD",
          SrcValueByLevel = {
            13,
            13,
            13,
            13,
            13
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCD",
          Src2Var = "CDReduction",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowerCD",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCD",
          Src2Var = "LowerCD",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "NewCD",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "NewCD",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "NewCD",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveCooldown",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "NewCD",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Distance", SrcValue = 240}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "MaxRange", SrcValue = 240}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "MaxRange",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "MaxRange",
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 75,
          DestVar = "Distance",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "Distance",
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      }
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "CastPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "LockOn", SrcValue = false}
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "CastPos",
      Range = 175,
      Flags = "AffectEnemies AffectNeutral AffectMinions ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetUnit,
            Params = {SrcVar = "Unit", DestVar = "Other1"}
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "LockOn", SrcValue = true}
          },
          {
            Function = BBIssueOrder,
            Params = {
              WhomToOrderVar = "Owner",
              TargetOfOrderVar = "Unit",
              Order = AI_ATTACKTO
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
      CenterVar = "CastPos",
      Range = 150,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetUnit,
            Params = {SrcVar = "Unit", DestVar = "Other1"}
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "LockOn", SrcValue = true}
          },
          {
            Function = BBIssueOrder,
            Params = {
              WhomToOrderVar = "Owner",
              TargetOfOrderVar = "Unit",
              Order = AI_ATTACKTO
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LockOn",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "Other1"}
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Other1"
        }
      },
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Other1",
          DestVar = "IsMoving",
          Status = IsMoving
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsMoving",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Distance",
              Src1Value = 0,
              Src2Value = 25,
              DestVar = "Distance",
              MathOp = MO_SUBTRACT
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Other1",
              Distance = 125,
              OffsetAngle = 0,
              PositionVar = "LeadPos"
            }
          },
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Owner", LocationVar = "LeadPos"}
          },
          {
            Function = BBDistanceBetweenObjectAndPoint,
            Params = {
              DestVar = "Distance",
              ObjectVar = "Owner",
              PointVar = "LeadPos"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "MaxRange",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "MaxRange",
              OffsetAngle = 0,
              PositionVar = "Pos"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Distance",
              Src1Value = 0,
              Src2Value = 25,
              DestVar = "Distance",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "Distance",
              OffsetAngle = 0,
              PositionVar = "Pos"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "NextBuffVars",
      SrcVar = "Count"
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
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 75,
      OffsetAngle = 0,
      PositionVar = "CheckPos"
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
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 40,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      }
    }
  },
  {
    Function = BBIsPathable,
    Params = {DestPosVar = "CheckPos", ResultVar = "Pathable"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Pathable",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 125,
          OffsetAngle = 0,
          PositionVar = "CheckPos"
        }
      },
      {
        Function = BBIsPathable,
        Params = {DestPosVar = "CheckPos", ResultVar = "Pathable"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Pathable",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 75,
              OffsetAngle = 180,
              PositionVar = "Pos"
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBUnlockAnimation,
        Params = {OwnerVar = "Owner", Blend = true}
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell1a",
          ScaleTime = 0,
          TargetVar = "Owner",
          Loop = false,
          Blend = true,
          Lock = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveSoundOne",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveBuffer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0.25,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveDamage",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
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
          BuffName = "UnlockAnimation",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.75,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "Pos",
          Speed = 825,
          Gravity = 15,
          MoveBackBy = 15,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = POSTPONE_CURRENT_ORDER,
          MovementOrdersFacing = KEEP_CURRENT_FACING,
          IdealDistance = 275
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBUnlockAnimation,
        Params = {OwnerVar = "Owner", Blend = true}
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell1b",
          ScaleTime = 0,
          TargetVar = "Owner",
          Loop = false,
          Blend = true,
          Lock = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveSoundTwo",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveBufferB",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0.25,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveDamage",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
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
          BuffName = "UnlockAnimation",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.75,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "Pos",
          Speed = 825,
          Gravity = 15,
          MoveBackBy = 15,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = POSTPONE_CURRENT_ORDER,
          MovementOrdersFacing = KEEP_CURRENT_FACING,
          IdealDistance = 275
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBUnlockAnimation,
        Params = {OwnerVar = "Owner", Blend = true}
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell1c",
          ScaleTime = 0,
          TargetVar = "Owner",
          Loop = false,
          Blend = true,
          Lock = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveSoundThree",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenTriCleaveDamage",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
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
          BuffName = "UnlockAnimation",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.75,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "Pos",
          Speed = 900,
          Gravity = 75,
          MoveBackBy = 15,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = POSTPONE_CURRENT_ORDER,
          MovementOrdersFacing = KEEP_CURRENT_FACING,
          IdealDistance = 375
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "RivenTriCleave"
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RivenSword",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
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
    Params = {
      Name = "riventricleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavecooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavesoundone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavebuffer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavedamage"
    }
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
      Name = "riventricleavesoundtwo"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavebufferb"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavesoundthree"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rivensword"}
  }
}
