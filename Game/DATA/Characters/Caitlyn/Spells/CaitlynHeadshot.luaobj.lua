BuffTextureName = "Caitlyn_Headshot2.dds"
BuffName = "CaitlynHeadshotReady"
SpellFXOverrideSkins = {
  "CaitlynSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynheadshotcount"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_headshot_rdy_indicator.troy"
    }
  }
}
