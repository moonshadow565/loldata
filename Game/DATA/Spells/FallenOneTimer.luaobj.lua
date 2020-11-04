PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 3,
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
      SpellSlot = 3,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
