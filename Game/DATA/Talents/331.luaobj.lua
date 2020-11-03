CharOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "FlatDR",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = TRUE_DAMAGE,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "FlatDR",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageAmount",
          Value2 = 0,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageAmount",
              SrcValue = 0
            }
          }
        }
      }
    }
  }
}
