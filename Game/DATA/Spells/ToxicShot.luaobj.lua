NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Teemo_PoisonedDart.dds"
BuffName = "Toxic Attack"
AutoBuffActivateEffect = ""
SpellToggleSlot = 3
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  }
}
