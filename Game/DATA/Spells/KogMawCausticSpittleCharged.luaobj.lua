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
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorReduction",
      SrcValue = 0,
      SrcValueByLevel = {
        -5,
        -10,
        -15,
        -20,
        -25
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorReduction",
      Delta = 0
    }
  }
}
