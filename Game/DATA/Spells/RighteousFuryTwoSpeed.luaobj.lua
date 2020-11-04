BuffTextureName = "Judicator_RighteousFury.dds"
BuffName = "RighteousFurySpeed"
BuffOnUpdateStatsBuildingBlocks = {
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
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  }
}
