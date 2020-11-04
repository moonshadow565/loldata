NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
ChainMissileParameters = {
  MaximumHits = {
    6,
    6,
    6,
    6,
    6
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
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
      Src1Var = "BaseAttackDamage",
      Src2Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalAD",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalAD",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "MultipliedAD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        20,
        35,
        50,
        65,
        80
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "MultipliedAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "Ricochet",
      ResetDuration = 0
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
          DamageVar = "DamageToDeal",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
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
              Src2Value = 0.8,
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
          DamageVar = "DamageToDeal",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 0,
          PercentOfAttackVar = "DamagePercent",
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
