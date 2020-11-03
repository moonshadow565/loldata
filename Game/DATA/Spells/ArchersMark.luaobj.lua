NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "Bowmaster_ArchersMark.dds"
BuffName = "Archer's Mark"
SpellToggleSlot = 3
PersistsThroughDeath = true
TriggersSpellCasts = true
NonDispellable = true
BuffOnKillBuildingBlocks = {
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
    Function = BBIncGold,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        1,
        2,
        3,
        4,
        5
      }
    }
  }
}
