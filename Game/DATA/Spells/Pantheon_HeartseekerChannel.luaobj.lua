TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDmg"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DmgPerLvl",
      SrcValueByLevel = {
        6,
        9,
        12,
        15,
        18
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PerLevel",
      SrcValueByLevel = {
        0.18,
        0.21,
        0.24,
        0.27,
        0.3
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDmg",
      Src2Var = "PerLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MultiDmg",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MultiDmg",
      Src2Var = "DmgPerLvl",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalDmg",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "FinalDmg",
          Src1Value = 2,
          Src2Value = 0,
          DestVar = "FinalDmg",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FinalDmg",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
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
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FinalDmg",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 0.5,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
