NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "ZiggsPassiveReady.dds"
BuffName = "ZiggsPassiveBuff"
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "ZiggsMadScientist"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ziggspassive_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ziggsshortfusecooldown"
    }
  }
}
