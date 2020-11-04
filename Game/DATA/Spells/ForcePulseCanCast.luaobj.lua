BuffTextureName = "Averdrian_ConsumeSpirit.dds"
BuffName = "ForcePulseAvailable"
AutoBuffActivateEffect = "ForcewalkReady.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 2,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 2,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
