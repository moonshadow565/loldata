NotSingleTargetSpell = true
BuffTextureName = "LuxCrashingBlitz2.dds"
BuffName = "LuxLightBindingMis"
AutoBuffActivateEffect = "LuxLightBinding_tar.troy"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "SteelLegionLux"
}
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
