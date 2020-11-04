NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "EzrealEssenceFluxDebuff"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktorentropicbeam_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktordeathraydot"
    }
  }
}
