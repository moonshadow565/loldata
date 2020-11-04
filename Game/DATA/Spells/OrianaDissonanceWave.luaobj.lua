NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KogMaw_VoidOoze.dds"
BuffName = "EzrealEssenceFluxDebuff"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianashock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "orianaslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianahaste"
    }
  }
}
