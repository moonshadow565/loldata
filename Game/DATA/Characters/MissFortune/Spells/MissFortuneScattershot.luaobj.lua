NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "MissFortuneSkin07"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunescatteraoe"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunescatterparticle"
    }
  }
}
