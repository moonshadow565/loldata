NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Cardmaster_PowerCard.dds"
BuffName = "Wild Cards"
AutoBuffActivateEffect = "SealFate_tar.troy"
AutoBuffActivateEffect2 = "GLOBAL_SILENCE.TROY"
AutoBuffActivateAttachBoneName2 = "head"
NonDispellable = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "Pos",
      EndPosVar = "Pos",
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false
    }
  }
}
