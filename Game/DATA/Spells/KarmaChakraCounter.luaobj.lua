NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "KarmaChakraCharge"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "KarmaChakraTimer"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 2,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "KarmaChakraTimer",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "MantraTimerCooldown",
                  DurationVarTable = "CharVars",
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
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellSlot", Info = GetSpellSlot}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellSlot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KarmaOneMantraParticle"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaOneMantraParticle"
            }
          }
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KarmaTwoMantraParticle"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaTwoMantraParticle"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaOneMantraParticle",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakracharge"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakratimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaonemantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmatwomantraparticle"
    }
  }
}
