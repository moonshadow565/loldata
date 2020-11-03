BuffTextureName = "Lich_WallOfPain.dds"
BuffName = "Wall of Pain Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swainshadowgrasproottemp.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_shadowgrasp_magic.troy"
    }
  }
}
