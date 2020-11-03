NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_fortify.dds"
BuffName = "FortifyBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Name",
      SpellSlotValue = 6,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Name",
      Value2 = "Recall",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 6,
          SlotType = InventorySlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "RecallImproved",
          TargetVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Name",
      Value2 = "OdinRecall",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 6,
          SlotType = InventorySlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "OdinRecallImproved",
          TargetVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "recallimproved"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinrecallimproved"
    }
  }
}
