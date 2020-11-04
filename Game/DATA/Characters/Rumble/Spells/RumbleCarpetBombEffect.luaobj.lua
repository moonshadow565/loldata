DoesntTriggerSpellCasts = true
BuffTextureName = "034_Steel_Shield.dds"
BuffName = "Danger Zone"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombburnorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombburndest"
    }
  }
}
