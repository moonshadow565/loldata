DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
BuffTextureName = "20.dds"
BuffName = "Blood Awareness"
SpellToggleSlot = 3
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodscent_target"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "bloodscent"}
  }
}
