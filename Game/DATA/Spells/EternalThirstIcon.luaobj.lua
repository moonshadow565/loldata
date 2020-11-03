BuffTextureName = "Wolfman_InnerHunger.dds"
BuffName = "Eternal Thirst"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "eternalthirst"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  }
}
