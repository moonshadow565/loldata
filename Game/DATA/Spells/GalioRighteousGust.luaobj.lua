NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffName = "GalioRighteousGust"
SpellFXOverrideSkins = {
  "GatekeeperGalio"
}
SpellVOOverrideSkins = {
  "GatekeeperGalio"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorgmgatekeeper"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorighteousgustmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_windtunnel_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorighteousgusthaste"
    }
  }
}
