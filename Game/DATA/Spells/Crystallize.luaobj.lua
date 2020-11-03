NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalwallpush"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "iceblock"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "aniviaiceblock"
    }
  }
}
