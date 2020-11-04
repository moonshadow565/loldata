CharOnPreDamageBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "curHealth",
      OwnerVar = "Target",
      Function = GetHealth
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "curHealth",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DAMAGESOURCE_RAW",
              CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "curHealth",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
                }
              }
            }
          }
        }
      }
    }
  }
}
