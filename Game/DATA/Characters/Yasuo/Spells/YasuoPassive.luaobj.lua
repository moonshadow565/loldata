BuffTextureName = "BlindMonkWOne.dds"
BuffName = "YasuoPassive"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuoisincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuonotincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuoruncyclemanager"
    }
  }
}
