NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        30,
        55,
        80,
        105,
        130
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "AkaliDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AkaliAP",
      Src1Value = 0.3,
      Src2Value = 0,
      DestVar = "AkaliAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliDamage",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "AkaliDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "AkaliDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliAP",
      Src2Var = "DamageToDeal",
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
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = true,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "VampPercent",
      Src1VarTable = "CharVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetArmor,
        Params = {TargetVar = "Target", DestVar = "MR"}
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "MR",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "Denominator",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MR",
          Src2Var = "Denominator",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Right",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Right",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "DR",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DR",
          Src2Var = "DamageToDeal",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DmgDealt",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "VampPercent",
          Src1VarTable = "CharVars",
          Src2Var = "DmgDealt",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Health",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "Health",
          HealerVar = "Owner"
        }
      }
    }
  }
}
