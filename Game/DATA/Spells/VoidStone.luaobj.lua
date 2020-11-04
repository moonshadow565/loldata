BuffTextureName = "Kassadin_VoidStone.dds"
BuffName = "VoidStone"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "voidstoneattackspeedboost"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flashback.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flash.troy"
    }
  }
}
