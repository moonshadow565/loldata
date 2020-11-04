NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "SightWard"
AutoBuffActivateEffect = "Ward_Sight_Idle.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sightwardstealth"
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
