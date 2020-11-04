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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APStat"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        80,
        160,
        240,
        320,
        400
      }
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
    Function = BBMath,
    Params = {
      Src1Var = "DazzleDamage",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "MinDamage",
      MathOp = MO_MULTIPLY
    }
  },
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
    Function = BBSetVarInTable,
    Params = {DestVar = "StunLength", SrcValue = 0.5}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 160,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 160,
          DestVar = "StunMult",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "StunLength",
          Src2Var = "StunMult",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "StunLength",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "StunLength",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "StunLength",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "StunMult",
          Src1Value = 5,
          Src2Value = 0,
          DestVar = "DamageMult",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageMult",
          Src1Value = 0,
          Src2Value = 4,
          DestVar = "DamageMult",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "DamageMult",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageMult",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DazzleDamage",
          Src2Var = "DamageMult",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DazzleDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DazzleDamage",
          Src2Var = "MinDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DazzleDamage",
          MathOp = MO_MAX
        }
      }
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 0,
      DurationVar = "StunLength"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
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
