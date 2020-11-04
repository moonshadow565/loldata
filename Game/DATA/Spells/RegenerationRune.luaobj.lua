AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "bountyActive",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "healthPercent",
      Value2 = 0.99,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 45,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "MonsterBankSmall"
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Owner",
                  BuffName = "MonsterBankBig"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "MonsterBankSmall",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
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
  }
}
