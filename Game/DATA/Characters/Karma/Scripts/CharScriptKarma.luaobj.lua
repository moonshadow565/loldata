PersistsThroughDeath = true
NonDispellable = true
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTime2Executed",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MantraTimerCooldown",
          SrcValueByLevel = {
            30,
            30,
            30,
            30,
            30,
            30,
            25,
            25,
            25,
            25,
            25,
            25,
            20,
            20,
            20,
            20,
            20,
            20
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMod",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMod",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MantraTimerCooldown",
          Src2Var = "CooldownMod",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "MantraTimerCooldown",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "MantraTimerCooldown",
          ValueVarTable = "CharVars",
          Index = 1,
          SlotNumber = 3,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      }
    }
  }
}
CharOnSpellCastBuildingBlocks = {
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
          BuffName = "KarmaChakra"
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
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MantraTimerCooldown",
      DestVarTable = "CharVars",
      SrcValue = 25
    }
  },
  {
    Function = BBIncSpellLevel,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaChakraCharge",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_AmmoStack,
      MaxStack = 3,
      NumberOfStacks = 2,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "MantraTimerCooldown",
      DurationVarTable = "CharVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaTranscendence",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
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
CharOnResurrectBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaChakraCharge",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_AmmoStack,
      MaxStack = 3,
      NumberOfStacks = 3,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaTwoMantraParticle",
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
CharOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      OverrideCastPosition = false,
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakracharge"
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
      Name = "karmatranscendence"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakracounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmatwomantraparticle"
    }
  }
}
