NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "EzrealEssenceFluxDebuff"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_ult_mis_tar_minion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_ult_mis_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_ult_mis_tar.troy "
    }
  }
}
