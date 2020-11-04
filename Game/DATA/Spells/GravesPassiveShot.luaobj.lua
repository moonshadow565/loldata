NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Judicator_RighteousFury.dds"
BuffName = "JudicatorRighteousFury"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "RighteousFuryHalo_buf.troy"
AutoBuffActivateAttachBoneName2 = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 1,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  }
}
