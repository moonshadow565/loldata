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
              BuffName = "KarmaOneMantraParticle",
              ResetDuration = 0
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
              BuffName = "KarmaTwoMantraParticle",
              ResetDuration = 0
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
  },
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
        Function = BBIf,
        Params = {
          Src1Var = "SpellSlot",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentCooldownMod,
              TargetVar = "Owner",
              DestVar = "CooldownStat"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseCooldown",
              SrcValue = 10
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownStat",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Multiplier",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Multiplier",
              Src2Var = "BaseCooldown",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "NewCooldown",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SrcVar = "NewCooldown",
              SlotNumber = 2,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaChakra",
              NumStacks = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "SpellSlot",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentCooldownMod,
              TargetVar = "Owner",
              DestVar = "CooldownStat"
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseCooldown",
              SrcValueByLevel = {
                15,
                14,
                13,
                12,
                11,
                10
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownStat",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Multiplier",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Multiplier",
              Src2Var = "BaseCooldown",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "NewCooldown",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SrcVar = "NewCooldown",
              SlotNumber = 1,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaChakra",
              NumStacks = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "SpellSlot",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentCooldownMod,
              TargetVar = "Owner",
              DestVar = "CooldownStat"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseCooldown",
              SrcValue = 6
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownStat",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Multiplier",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Multiplier",
              Src2Var = "BaseCooldown",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "NewCooldown",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SrcVar = "NewCooldown",
              SlotNumber = 0,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KarmaChakra",
              NumStacks = 1
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
      Name = "karmaonemantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmatwomantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  }
}
