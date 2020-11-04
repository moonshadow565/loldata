CharOnKillUnitBuildingBlocks = {}
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "Slot", Info = GetSpellSlot}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Slot",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XarinPassive"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "XarinPassive"
                }
              }
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Slot",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
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
              DestVar = "BuffDuration",
              SrcValueByLevel = {
                8,
                8,
                8,
                8,
                8
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MagicPen",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                0.1,
                0.15,
                0.2,
                0.25,
                0.3
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XarinSiege",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "BuffDuration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Slot",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XarinPassive"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "XarinPassive"
                }
              }
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Slot",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "XarinPassive"
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Owner",
                  BuffName = "XarinEWrapper"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffClear,
                    Params = {
                      TargetVar = "Owner",
                      BuffName = "XarinPassive"
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
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XarinParticleBuff",
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
      BuffName = "XerathAscended",
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
CharOnResurrectBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XarinParticleBuff",
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
      Name = "xarinpassive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "xarinsiege"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xarinewrapper"
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
      Name = "xarinparticlebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathascended"
    }
  }
}
