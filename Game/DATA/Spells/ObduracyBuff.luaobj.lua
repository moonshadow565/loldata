NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Malphite_BrutalStrikes.dds"
BuffName = "MalphiteDamageBuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_enrage_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_enrage_buf.troy"
    }
  }
}
