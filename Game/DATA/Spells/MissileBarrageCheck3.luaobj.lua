BuffTextureName = "Corki_MissileBarrage.dds"
BuffName = "MissileBarrageCheck3"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
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
OnBuffDeactivateBuildingBlocks = {
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
