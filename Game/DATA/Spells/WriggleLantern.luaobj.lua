NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
BuffTextureName = "3154_WriggleLantern.dds"
BuffName = "WriggleLantern"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wrigglelantern"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sightward"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "sightward"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sharedwardbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wrigglelanternward"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemplacementmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryscoutbuff"
    }
  }
}
