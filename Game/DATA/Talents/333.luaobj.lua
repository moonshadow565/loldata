CharOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = 0.01,
      DestVar = "DRPERC",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DRPERC",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "DamageMultiplier",
      MathOp = MO_SUBTRACT
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
        Function = BBIf,
        Params = {Value1 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "DamageMultiplier",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
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
  }
}
