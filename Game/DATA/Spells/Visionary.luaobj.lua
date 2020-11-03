BuffTextureName = "Yeti_FrostNova.dds"
BuffName = "Visions"
AutoBuffActivateEffect = "Visionary_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "LevelZero",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "LevelOne",
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
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellTwoMana",
      SrcValueByLevel = {
        -75,
        -85,
        -95,
        -105,
        -115
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "LevelTwo", SrcVar = "Level"}
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellThreeMana",
      SrcValueByLevel = {
        -150,
        -225,
        -300
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "LevelThree", SrcVar = "Level"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LevelZero",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 0,
          SlotType = SpellSlots,
          Cost = -80
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LevelOne",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 1,
          SlotType = SpellSlots,
          Cost = -75
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LevelTwo",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 2,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "SpellTwoMana"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LevelThree",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "SpellThreeMana"
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = 0
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = 0
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
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
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
