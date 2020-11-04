ItemOnTakeDamageBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "HexdrinkerTimer"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "Hexdrinker"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageType",
              Value2 = MAGIC_DAMAGE,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "DamageAmount",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "HealthPercent",
                      OwnerVar = "Owner",
                      Function = GetHealthPercent,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "HealthPercent",
                      Value2 = 0.4,
                      CompareOp = CO_LESS_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "Hexdrinker",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 4,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "HexdrinkerTimer",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 60,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
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
      Name = "hexdrinkertimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "hexdrinker"}
  }
}
