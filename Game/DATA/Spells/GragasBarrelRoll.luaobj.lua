NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GragasBarrelRoll.dds"
BuffName = "GragasBarrelRoll"
SpellToggleSlot = 1
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelroll"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrolltoggle"
    }
  }
}
