NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = false
BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
SpellToggleSlot = 3
TargetExecuteBuildingBlocks = {
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
