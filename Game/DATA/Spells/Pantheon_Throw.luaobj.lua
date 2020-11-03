TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "AtkDmg"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PerDmg",
      SrcValueByLevel = {
        1,
        1.15,
        1.3,
        1.45,
        1.6
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ThrowDmg",
      SrcValueByLevel = {
        30,
        40,
        50,
        60,
        70
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PerDmg",
      Src2Var = "AtkDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PerDmgFinal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PerDmgFinal",
      Src2Var = "ThrowDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ThrowDmgFinal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "ThrowDmgFinal",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  }
}
