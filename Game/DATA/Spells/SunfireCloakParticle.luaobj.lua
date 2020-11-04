BuffTextureName = "3068_Sunfire_Cape.dds"
BuffName = "Sunfire Cape Self"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sunfirecape_aura.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sunfirecapeaura"
    }
  }
}
