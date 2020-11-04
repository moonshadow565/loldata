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
      Name = "malphitecleaveenragedhit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphitecleavehit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_physical.troy"
    }
  }
}
