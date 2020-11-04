NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "DamageTotal"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageTotal",
      Src1Value = 0.55,
      Src2Value = 0,
      DestVar = "DamageVar",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APTotal"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "APTotal",
      Src1Value = 0.3,
      Src2Value = 0,
      DestVar = "APVar",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageVar",
      Src2Var = "APVar",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DaggerBase",
          SrcValueByLevel = {
            50,
            65,
            80
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageVar",
          Src2Var = "DaggerBase",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDeal",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Target",
          DamageByLevel = {
            0,
            0,
            0,
            0,
            0
          },
          Damage = 0,
          DamageVar = "DamageToDeal",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Target",
          DamageByLevel = {
            50,
            65,
            80,
            0,
            0
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.3,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
