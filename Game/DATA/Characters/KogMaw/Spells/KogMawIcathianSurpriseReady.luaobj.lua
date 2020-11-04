BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianSurpriseReady"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kognoseglow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmaw_deepsea_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprise"
    }
  }
}
