BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "Counter Strike Can Cast"
AutoBuffActivateEffect = ""
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "counterstrike_ready.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "counterstrike_dodged.troy"
    }
  }
}
