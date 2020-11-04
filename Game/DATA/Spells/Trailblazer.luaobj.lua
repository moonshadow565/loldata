BuffTextureName = "Teemo_EagleEye.dds"
BuffName = "Eagle Eye"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trailblazerapplicator"
    }
  }
}
