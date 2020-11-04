BuffTextureName = "Galio_RighteousGust.dds"
BuffName = "GalioRighteousGustHaste"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_windtunnel_speed_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
