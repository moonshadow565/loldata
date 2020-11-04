OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Owner",
      DestVar = "YorickLevel"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "YorickAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "YorickAP",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "HealthFromAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "YorickAP",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "ADFromAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "YorickLevel",
      Src1Value = 50,
      Src2Value = 0,
      DestVar = "HealthFromLevel",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "YorickLevel",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "ADFromLevel",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ADFromLevel",
      Src2Var = "ADFromAP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalAD",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthFromLevel",
      Src2Var = "HealthFromAP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalHealth",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Attacker",
      DeltaVar = "TotalHealth",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Attacker",
      DeltaVar = "TotalAD",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Attacker",
      DeltaVar = "TotalAD",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Attacker",
      DeltaVar = "TotalAD",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Attacker",
          Damage = 9999,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_INTERNALRAW,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
