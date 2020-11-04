CharOnSpellCastBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Nothing",
      BuffName = "LeblancSlideM"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "SlotName", Info = GetSpellName}
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "LeblancChaosOrb",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "LeblancChaosOrbM",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "Cooldown",
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner",
                  BroadcastEvent = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
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
                  DestVar = "lastCast",
                  DestVarTable = "CharVars",
                  SrcValue = 0
                }
              }
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "LeblancSlide",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "leblancslidem",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "Cooldown",
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner",
                  BroadcastEvent = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
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
                  DestVar = "lastCast",
                  DestVarTable = "CharVars",
                  SrcValue = 1
                }
              }
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "SlotName",
          Value2 = "LeblancSoulShackle",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "LeblancSoulShackleM",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "Cooldown",
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner",
                  BroadcastEvent = true
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
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
                  DestVar = "lastCast",
                  DestVarTable = "CharVars",
                  SrcValue = 2
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "LeblancPassive",
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
  },
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "lastCast",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  }
}
CharOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "lastCast",
              Src1VarTable = "CharVars",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "LeblancChaosOrbM",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {CompareOp = CO_EQUAL},
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "leblancslidem",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetSpell,
                Params = {
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SlotBook = SPELLBOOK_CHAMPION,
                  SpellName = "LeblancSoulShackleM",
                  TargetVar = "Owner"
                }
              },
              {
                Function = BBSealSpellSlot,
                Params = {
                  SpellSlot = 3,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  TargetVar = "Owner",
                  State = false
                }
              }
            }
          }
        }
      }
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
      Name = "leblancslidem"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshacklem"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancpassive"
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
      Name = "championchampiondelta"
    }
  }
}
