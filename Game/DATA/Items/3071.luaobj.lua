BuffTextureName = "3071_The_Black_Cleaver.dds"
BuffName = "BlackCleaver"
ItemOnHitUnitBuildingBlocks = {
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ArmorReduction",
                  DestVarTable = "NextBuffVars",
                  SrcValue = -15
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "BlackCleaver",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Shred,
                  MaxStack = 3,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      }
    }
  }
}
ItemOnBeingDodgedBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ArmorReduction",
              DestVarTable = "NextBuffVars",
              SrcValue = -15
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Owner",
              BuffName = "BlackCleaver",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Shred,
              MaxStack = 3,
              NumberOfStacks = 1,
              Duration = 5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
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
      Name = "blackcleaver"
    }
  }
}
