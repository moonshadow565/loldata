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
  "SightWardGingerBread",
  "SightWardLantern",
  "SightWardBanner"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
