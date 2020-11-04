BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Strike"
AutoBuffActivateEffect = "AlphaStrike_prison.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alphastrike"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "alphastrike_slash.troy"
    }
  }
}
