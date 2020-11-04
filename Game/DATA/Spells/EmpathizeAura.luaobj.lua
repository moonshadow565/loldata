BuffTextureName = "FallenAngel_Empathize.dds"
BuffName = "Empathize"
AutoBuffActivateEffect = "Empathize_buf.troy"
PersistsThroughDeath = true
NonDispellable = true
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
