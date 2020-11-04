NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "SightWard"
PreLoadBuildingBlocks = {
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
    Params = {Name = "wardbounty"}
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
      Name = "itemplacementmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryscoutbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dummywardtracker"
    }
  }
}
