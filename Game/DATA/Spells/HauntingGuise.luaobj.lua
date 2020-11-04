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
    Params = {
      Src1Var = "DamageType",
      Value2 = MAGIC_DAMAGE,
      CompareOp = CO_EQUAL
    },
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
