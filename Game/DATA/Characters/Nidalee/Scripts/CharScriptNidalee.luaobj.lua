UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBIsInBrush,
    Params = {UnitVar = "Attacker", ResultVar = "IsInBrush"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsInBrush",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Prowl",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 500,
          Flags = "AffectFriends AffectHeroes NotAffectSelf ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBGetLevel,
            Params = {TargetVar = "Unit", DestVar = "UnitLevel"}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "OwnerLevel",
              Src2Var = "UnitLevel",
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBIncExp,
                Params = {TargetVar = "Unit", Delta = 5}
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
      DestVar = "DrippingWoundDuration",
      DestVarTable = "CharVars",
      SrcValue = 10
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrippingWoundMax",
      DestVarTable = "CharVars",
      SrcValue = 5
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 40,
      Index = 1,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 125,
      Index = 1,
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 150,
      Index = 1,
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TakedownDamage",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            40,
            70,
            100
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PounceDamage",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            125,
            175,
            225
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SwipeDamage",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            150,
            225,
            300
          }
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "TakedownDamage",
          ValueVarTable = "CharVars",
          Index = 1,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "PounceDamage",
          ValueVarTable = "CharVars",
          Index = 1,
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "SwipeDamage",
          ValueVarTable = "CharVars",
          Index = 1,
          SlotNumber = 2,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
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
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "prowl"}
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
  }
}
