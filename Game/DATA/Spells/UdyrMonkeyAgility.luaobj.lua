NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "BlindMonk_FistsOfFury.dds"
BuffName = "UdyrPassiveBuff"
PersistsThroughDeath = true
Nondispellable = true
BuffOnSpellCastBuildingBlocks = {
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrMonkeyAgilityBuff",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrMA0"
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "UdyrMA1"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrMA2",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 5,
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
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrMA1",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "UdyrMA2"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrMA0",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 5,
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
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrMA1"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "UdyrMA2",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 5,
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
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "UdyrMA1",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 5,
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
    Params = {
      Name = "udyrmonkeyagilitybuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "udyrma0"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "udyrma1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "udyrma2"}
  }
}
