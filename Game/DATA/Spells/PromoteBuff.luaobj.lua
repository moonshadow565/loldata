BuffTextureName = ""
BuffName = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 15,
          DestVar = "DamageAmount",
          MathOp = MO_ADD
        }
      }
    }
  }
}
