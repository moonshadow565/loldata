NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KogMaw_CausticSpittle.dds"
BuffName = "KogMawCausticSpittle"
IsPetDurationBuff = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawcausticspittlecharged"
    }
  }
}
