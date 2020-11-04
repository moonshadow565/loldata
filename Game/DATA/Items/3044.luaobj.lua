ItemOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Value1 = 0.25, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "ItemSlow",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Slow,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 2.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Target",
                          BuffName = "Internal_40Slow",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 2.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
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
    Params = {Name = "ItemSlow"}
  }
}
