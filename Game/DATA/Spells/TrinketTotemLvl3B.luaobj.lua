NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "096_Eye_of_the_Observer.dds"
BuffName = "Magical Sight Ward"
AutoBuffActivateEffect = "Ward_Vision_Idle.troy"
SpellFXOverrideSkins = {
  "SightWardBat",
  "SightWardStone",
  "SightWardSpider",
  "SightWardTree",
  "SightWardGhost",
  "SightWardSnowMan",
  "SightWardGingerBread",
  "SightWardLantern",
  "SightWardBanner"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "visionward"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "visionward"}
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
      Name = "trinkettotemlvl3audio"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "wardbounty"}
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
      Name = "expirationtimer"
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
