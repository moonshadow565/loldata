ItemOnSpellHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "IsAttack", Info = GetIsAttackOverride}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsAttack",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DoesntTriggerSpellCasts",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "AttackSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "NotSingleTargetSpell",
                  Src1VarTable = "SpellVars",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MovementSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValue = -0.15
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MovementSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValue = -0.35
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "Chilled",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 1.5,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  }
}
