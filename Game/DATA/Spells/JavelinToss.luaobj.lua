NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
SpellDamageRatio = 1
TriggersSpellCasts = false
PopupMessage1 = "game_floatingtext_Slowed"
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Target",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDamage",
          SrcValueByLevel = {
            55,
            95,
            140,
            185,
            230
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AP"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AP",
          Src1Value = 0,
          Src2Value = 0.55,
          DestVar = "APDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseDamage",
          Src2Var = "APDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "StartingDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 1000,
          DestVar = "Multiplicant",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplicant",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Multiplicant",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplicant",
          Src1Value = 0,
          Src2Value = 2.5,
          DestVar = "Multiplicant",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplicant",
          Src2Var = "StartingDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "FinalDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FinalDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      }
    }
  }
}
