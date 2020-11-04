NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KogMaw_VoidOoze.dds"
BuffName = "EzrealEssenceFluxDebuff"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "manaleach_tar2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "orianadot"}
  }
}
