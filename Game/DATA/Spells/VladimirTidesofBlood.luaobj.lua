NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Vladimir_TidesofBlood.dds"
BuffName = ""
AutoBuffActivateEffect = ""
SpellFXOverrideSkins = {
  "BloodkingVladimir"
}
SpellVOOverrideSkins = {
  "BloodkingVladimir"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodcost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodnuke"
    }
  }
}
