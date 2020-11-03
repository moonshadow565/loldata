NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "APStat",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "APStat",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        40,
        70,
        100,
        130,
        160
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxMultiplier",
      SrcValue = 2
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxMultiplier",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "MaxMultiplier",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "APStat",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DazzleDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetCastRange,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SlotNumber = 2,
      SlotType = SpellSlots,
      RangeVar = "CastRange"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FullDamageRange",
      SrcValue = 250
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CastRange",
      Src2Var = "FullDamageRange",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "VaryingRange",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "CastRange",
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src2Var = "FullDamageRange",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Distance",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src2Var = "VaryingRange",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Multiplier",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Multiplier",
          Value2 = 1,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Multiplier", SrcValue = 1}
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplier",
          Src2Var = "MaxMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplier",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Multiplier",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DazzleDamage",
          Src2Var = "Multiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DazzleDamage",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 1.5
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DazzleDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
