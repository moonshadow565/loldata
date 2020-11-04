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
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_return_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_return_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_return_mis.troy"
    }
  }
}
