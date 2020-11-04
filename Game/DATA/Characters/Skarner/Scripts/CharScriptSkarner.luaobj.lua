UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AD",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusDamage",
      Index = 1,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  }
}
CharOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
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
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "CDR", SrcValue = 1}
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "CDR", SrcValue = 0.5}
                  }
                }
              },
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "cooldown",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellCooldownTime
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "cooldown",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "cooldown",
                      Src2Var = "CDR",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "newCooldown",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSetSlotSpellCooldownTimeVer2,
                    Params = {
                      Src = 0,
                      SrcVar = "newCooldown",
                      SlotNumber = 0,
                      SlotType = SpellSlots,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      OwnerVar = "Owner",
                      BroadcastEvent = false
                    }
                  }
                }
              },
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "cooldown",
                  SpellSlotValue = 1,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellCooldownTime
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "cooldown",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "cooldown",
                      Src2Var = "CDR",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "newCooldown",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSetSlotSpellCooldownTimeVer2,
                    Params = {
                      Src = 0,
                      SrcVar = "newCooldown",
                      SlotNumber = 1,
                      SlotType = SpellSlots,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      OwnerVar = "Owner",
                      BroadcastEvent = false
                    }
                  }
                }
              },
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "cooldown",
                  SpellSlotValue = 2,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellCooldownTime
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "cooldown",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "cooldown",
                      Src2Var = "CDR",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "newCooldown",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSetSlotSpellCooldownTimeVer2,
                    Params = {
                      Src = 0,
                      SrcVar = "newCooldown",
                      SlotNumber = 2,
                      SlotType = SpellSlots,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      OwnerVar = "Owner",
                      BroadcastEvent = false
                    }
                  }
                }
              },
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "cooldown",
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
                  Src1Var = "cooldown",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "cooldown",
                      Src2Var = "CDR",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "newCooldown",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSetSlotSpellCooldownTimeVer2,
                    Params = {
                      Src = 0,
                      SrcVar = "newCooldown",
                      SlotNumber = 3,
                      SlotType = SpellSlots,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      OwnerVar = "Owner",
                      BroadcastEvent = false
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
      BuffName = "SkarnerBrushCheck",
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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AD",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusDamage",
      Index = 1,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
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
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Slot", Info = GetSpellSlot}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SkarnerImpaleFlashLock",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerbrushcheck"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerimpaleflashlock"
    }
  }
}
