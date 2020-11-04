NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = false
BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
TargetExecuteBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
