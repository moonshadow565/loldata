BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "EmpowerCleave"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
