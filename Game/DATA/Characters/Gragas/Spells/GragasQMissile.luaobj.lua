NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "GragasQMissile"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasqboom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasqrender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasqmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gragasq"}
  }
}
