NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sejuani_ArcticAssault.dds"
BuffName = "SejuaniArcticAssault"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniarcticassaultminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniarcticassaultmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniarcticassault"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_arctic_assault_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_arctic_assault_cas_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_arcticassault_impact.troy"
    }
  }
}
