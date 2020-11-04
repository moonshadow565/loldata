DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Malphite_BrutalStrikes.dds"
BuffName = "MalphiteCleave"
PersistsThroughDeath = true
NonDispellable = true
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Malphite_Base_CleaveEnragedHit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Malphite_Base_CleaveHit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_physical.troy"
    }
  }
}
