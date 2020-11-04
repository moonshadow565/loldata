NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "SightWard"
AutoBuffActivateEffect = "Ward_Sight_Idle.troy"
SpellFXOverrideSkins = {
  "SightWardBat",
  "SightWardGhost",
  "SightWardSpider",
  "SightWardTree",
  "SightWardStone",
  "SightWardSnowMan",
  "SightWardGingerBread"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ward_sight_death.troy"
    }
  },
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
