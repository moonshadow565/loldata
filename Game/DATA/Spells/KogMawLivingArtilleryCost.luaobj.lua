BuffTextureName = "KogMaw_LivingArtillery.dds"
BuffName = "KogMawLivingArtillery"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  }
}
