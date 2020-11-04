NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GragasBarrelRoll.dds"
BuffName = "GragasBarrelRoll"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollboom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelrollrender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbarrelroll"
    }
  }
}
