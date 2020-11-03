NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CDOne",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
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
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CDOne",
          Value2 = 0.24,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.24,
              SlotNumber = 0,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      }
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CDTwo",
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
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CDTwo",
          Value2 = 0.24,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.24,
              SlotNumber = 1,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CDThree",
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
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CDThree",
          Value2 = 0.24,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.24,
              SlotNumber = 2,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      }
    }
  },
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CDFour",
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
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CDFour",
          Value2 = 0.24,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0.24,
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
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OrianaGlobalCooldown"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaglobalcooldown"
    }
  }
}
