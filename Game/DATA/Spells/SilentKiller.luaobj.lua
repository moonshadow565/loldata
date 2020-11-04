BuffTextureName = "Evelynn_Stalk.dds"
BuffName = "Silent Killer"
PersistsThroughDeath = true
NonDispellable = true
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value2 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.7,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
