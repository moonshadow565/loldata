BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = 0.15, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_HERO},
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      CasterVar = "Owner",
                      BuffName = "UdyrTigerStance"
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "DamageAmount",
                          Src1Value = 0,
                          Src2Value = 500,
                          DestVar = "DamageAmount",
                          MathOp = MO_ADD
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "DamageAmount",
                          Src1Value = 0,
                          Src2Value = 1500,
                          DestVar = "DamageAmount",
                          MathOp = MO_ADD
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerstance"
    }
  }
}
