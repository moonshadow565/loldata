BuffTextureName = "096_Eye_of_the_Observer.dds"
BuffName = "Magical Sight"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "negativeturretdelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "positiveturretdelta"
    }
  }
}
