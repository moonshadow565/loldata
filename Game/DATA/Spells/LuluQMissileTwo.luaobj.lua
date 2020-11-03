NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "EzrealEssenceFluxDebuff"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "luluqslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "luluqhit"}
  }
}
