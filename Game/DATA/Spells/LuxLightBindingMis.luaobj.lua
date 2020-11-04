NotSingleTargetSpell = true
BuffTextureName = "LuxCrashingBlitz2.dds"
BuffName = "LuxLightBindingMis"
AutoBuffActivateEffect = "LuxLightBinding_tar.troy"
AutoBuffActivateAttachBoneName = ""
PopupMessage1 = "game_floatingtext_Snared"
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
