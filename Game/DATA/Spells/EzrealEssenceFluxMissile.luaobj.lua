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
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealrisingspellforce"
    }
  },
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
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealessenceflux"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealessencefluxmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_pulsefire_essenceflux_tar.troy"
    }
  }
}
