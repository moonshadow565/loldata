NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Pirate_GrogSoakedBlade.dds"
BuffName = "Scurvy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "scurvystrikeparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "scurvystrike"
    }
  }
}
