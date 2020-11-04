NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2.2
BuffName = ""
ChannelingStartBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Owner",
      LocationVar = "CastPosition"
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      SrcVar = "CastPosition",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "counter",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "counter",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "missFortune_ult_cas_muzzle_flash.troy",
      Flags = 0,
      EffectIDVar = "goodluck",
      BoneName = "BUFFBONE_CSTM_WEAPON_3",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "missFortune_ult_cas_muzzle_flash.troy",
      Flags = 0,
      EffectIDVar = "goodluck",
      BoneName = "BUFFBONE_CSTM_WEAPON_1",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "missFortune_left_ult_cas.troy",
      Flags = 0,
      EffectIDVar = "goodluck",
      BoneName = "L_weapon",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "missFortune_ult_cas.troy",
      Flags = 0,
      EffectIDVar = "goodluck",
      BoneName = "R_weapon",
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
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 20,
      PositionVar = "Point1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 12,
      PositionVar = "Point2"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 4,
      PositionVar = "Point3"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 356,
      PositionVar = "Point4"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 348,
      PositionVar = "Point5"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 340,
      PositionVar = "Point6"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 350,
      PositionVar = "Point7"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 345,
      PositionVar = "Point8"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 340,
      PositionVar = "Point9"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 0,
      PositionVar = "Point0"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "MissFortuneWaves"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "ModValue",
      MathOp = MO_MODULO
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ModValue",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point1",
          EndPosVar = "Point1",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point2",
          EndPosVar = "Point2",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point3",
          EndPosVar = "Point3",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point4",
          EndPosVar = "Point4",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point5",
          EndPosVar = "Point5",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point6",
          EndPosVar = "Point6",
          OverrideCastPosition = false,
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point0",
          EndPosVar = "Point8",
          OverrideCastPosition = false,
          SlotNumber = 3,
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
      Src1Var = "ModValue",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point1",
          EndPosVar = "Point1",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point2",
          EndPosVar = "Point2",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point3",
          EndPosVar = "Point3",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point4",
          EndPosVar = "Point4",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point5",
          EndPosVar = "Point5",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point6",
          EndPosVar = "Point6",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Point0",
          EndPosVar = "Point8",
          OverrideCastPosition = false,
          SlotNumber = 3,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MissFortuneWaves",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 8,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Count",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 8,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Owner",
          StopCondition = ChannelingStopCondition_Success,
          StopSource = ChannelingStopSource_TimeCompleted
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MissFortuneBulletSound"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MissFortuneBulletSound"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_ult_cas_muzzle_flash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_left_ult_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_ult_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunewaves"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunebulletsound"
    }
  }
}
