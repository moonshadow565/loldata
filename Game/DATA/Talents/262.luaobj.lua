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
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "HealthPerc",
                  OwnerVar = "Target",
                  Function = GetHealthPercent,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HealthPerc",
                  Value2 = 0.4,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 1.06,
                      DestVar = "DamageAmount",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
