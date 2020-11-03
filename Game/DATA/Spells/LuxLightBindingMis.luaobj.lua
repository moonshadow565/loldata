NotSingleTargetSpell = true
BuffTextureName = "LuxCrashingBlitz2.dds"
BuffName = "LuxLightBindingMis"
AutoBuffActivateEffect = "LuxLightBinding_tar.troy"
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxlightbinding"
    }
  }
}
