BuffTextureName = "Corki_MissileBarrage.dds"
BuffName = "MissileBarrageCheck3"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
