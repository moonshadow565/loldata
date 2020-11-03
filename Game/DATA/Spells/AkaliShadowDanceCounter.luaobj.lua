PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "AkaliShadowDanceTimer"
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromCaster,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              CasterVar = "Owner",
              BuffName = "AkaliShadowDance"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 3,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "AkaliShadowDanceTimer",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "DanceTimerCooldown",
                  DurationVarTable = "CharVars",
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
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AkaliShadowDance",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 3,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          CasterVar = "Owner",
          BuffName = "AkaliShadowDance"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "AkaliShadowDanceTimer"
            }
          }
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AkaliShadowDance",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 3,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "AkaliShadowDance"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "AkaliShadowDanceTimer"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowdancetimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowdance"
    }
  }
}
