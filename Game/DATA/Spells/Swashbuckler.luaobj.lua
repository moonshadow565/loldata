BuffTextureName = "MasterYi_DoubleStrike.dds"
BuffName = "Swashbuckler"
Nondispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetManaOrHealth,
            Params = {
              DestVar = "TargetHealth",
              OwnerVar = "Target",
              Function = GetHealthPercent
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TargetHealth",
              Value2 = 0.3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 1.3,
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
