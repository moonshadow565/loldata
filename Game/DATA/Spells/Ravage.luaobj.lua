NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Evelynn_Ravage.dds"
BuffName = "Ravage"
AutoBuffActivateEffect = "RendingShot_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorStealAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellStealAmount",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorStealAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "SpellStealAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorMin",
      SrcValueByLevel = {
        -10,
        -15,
        -20,
        -25,
        -30
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellMin",
      SrcValueByLevel = {
        -10,
        -15,
        -20,
        -25,
        -30
      }
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
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
      Src2Value = 1200,
      DestVar = "dashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 15,
      DestVar = "Distance",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
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
    Function = BBIsPathable,
    Params = {DestPosVar = "TargetPos", ResultVar = "CheckVar"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CheckVar",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
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
      DestVar = "dashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "dashSpeed"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorStealAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "ArmorMin"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellStealAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "SpellMin"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      DestVarTable = "NextBuffVars",
      SrcVar = "Level"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffName = "RavageDash",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ravagedash"}
  }
}
