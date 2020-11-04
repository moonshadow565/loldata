NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "barondebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "baronattackstop"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "SRU_baron_spike_animated.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "baronspikehit"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "baronspellcastdetect"
    }
  }
}
