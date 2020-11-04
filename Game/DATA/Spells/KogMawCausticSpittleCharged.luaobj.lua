NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "KogMaw_CausticSpittle.dds"
BuffName = "KogMawCausticSpittleCharged"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
BuffOnUpdateStatsBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPen",
      SrcValue = 0,
      SrcValueByLevel = {
        0.26,
        0.32,
        0.38,
        0.44,
        0.5
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorPen",
      Delta = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPen2",
      SrcValue = 0,
      SrcValueByLevel = {
        26,
        32,
        38,
        44,
        50
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ArmorPen2",
      Index = 1
    }
  }
}
