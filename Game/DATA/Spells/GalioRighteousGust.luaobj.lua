NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = "GalioRighteousGust"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorighteousgustmissile"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "galio"}
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
