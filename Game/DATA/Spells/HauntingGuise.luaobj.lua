BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = 20
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_SPELL, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.1,
          DestVar = "HealthToHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthToHeal",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "HealthToHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthToHeal",
          HealerVar = "Owner"
        }
      }
    }
  }
}
