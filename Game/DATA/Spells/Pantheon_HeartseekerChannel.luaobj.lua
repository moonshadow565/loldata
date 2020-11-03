NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "BaseDmg"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DmgPerLvl",
      SrcValueByLevel = {
        4,
        6,
        8,
        10,
        12
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PerLevel",
      SrcValueByLevel = {
        0.28,
        0.31,
        0.34,
        0.37,
        0.4
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
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FinalDmg",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FinalDmg",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
