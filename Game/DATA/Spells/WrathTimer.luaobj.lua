NonDispellable = True
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      SlotNumber = 2,
      SlotType = SpellSlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = false,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false
    }
  }
}
