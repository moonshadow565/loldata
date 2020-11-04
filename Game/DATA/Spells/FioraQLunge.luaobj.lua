BuffTextureName = "Irelia_Bladesurge.dds"
BuffName = "IreliaGatotsuDash"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fioraqlunge_dashtrail.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraqlungeparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraflurrydummy"
    }
  }
}
