NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "ViktorChaosStorm.dds"
BuffName = "ViktorStormGuide"
SpellDamageRatio = 0.5
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
      Name = "viktorchaosstormhighlight"
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
  }
}
