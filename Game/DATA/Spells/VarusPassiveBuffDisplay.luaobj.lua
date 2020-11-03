NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "VarusPassive.dds"
BuffName = "VarusPassiveBuffDisplay"
AutoBuffActivateEffect = "VarusPassive.troy"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-big.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-med.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-small.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuspassivebuffdisplayminion"
    }
  }
}
