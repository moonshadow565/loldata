CharOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = TRUE_DAMAGE,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level",
          SrcVar = "TalentLevel"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HavocDamage",
          SrcValueByLevel = {1.04, 1.08}
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HavocDamage",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
