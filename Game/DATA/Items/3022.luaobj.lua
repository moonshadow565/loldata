AutoBuffActivateEffect = "Global_Freeze.troy"
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
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Owner", CompareOp = CO_IS_MELEE},
                    SubBlocks = {
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Target",
                          BuffName = "Internal_30Slow",
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
                  },
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
