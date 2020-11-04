NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Viktor_R1.dds"
BuffName = "ViktorChaosStormGuide"
IsPetDurationBuff = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstormguide"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorexpirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_skn3_rosition.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursor_moveto.troy"
    }
  }
}
