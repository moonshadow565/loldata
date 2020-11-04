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
  "SightWardGhost"
}
MinimapIconTextureName = "Minimap_Ward_Pink_Friendly.tga"
MinimapIconEnemyTextureName = "Minimap_Ward_Pink_Enemy.tga"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sightwardstealth"
    }
  },
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
