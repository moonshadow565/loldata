NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "VarusPassive.dds"
BuffName = "VarusPassiveBuffDisplay"
AutoBuffActivateEffect = "VarusPassiveMinion.troy"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-red-big.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-red-med.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus-bow-glow-red-small.troy"
    }
  }
}
