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
        10,
        15,
        20,
        30,
        40
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PerLevel",
      SrcValueByLevel = {
        0.3,
        0.35,
        0.4,
        0.45,
        0.5
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
