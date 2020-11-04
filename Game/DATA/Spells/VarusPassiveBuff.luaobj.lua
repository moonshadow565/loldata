NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "12.dds"
BuffName = "VarusPassiveBuff"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "VarusAscended"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivebuffdisplay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivebuffdisplayminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivetracker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusidle.troy"
    }
  }
}
