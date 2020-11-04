BuffTextureName = "Kassadin_ForcePulse_Charging.dds"
BuffName = "ForcePulse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "forcepulsecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "forcepulsecancast"
    }
  }
}
