NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
ChainMissileParameters = {
  MaximumHits = {
    2,
    3,
    4,
    5,
    6
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "TargetNum", Info = GetCastSpellTargetsHitPlusOne}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseAttackDamage"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetNum",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseAttackDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
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
        Function = BBSetVarInTable,
        Params = {DestVar = "Counter", SrcValue = 1}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamagePercent",
          SrcValue = 1
        }
      },
      {
        Function = BBWhile,
        Params = {
          Src1Var = "Counter",
          Src2Var = "TargetNum",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamagePercent",
              Src1Value = 0,
              Src2Value = 0.75,
              DestVar = "DamagePercent",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Counter",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "Counter",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseAttackDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 0,
          PercentOfAttackVar = "DamagePercent",
          SpellDamageRatio = 1,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
