BuffTextureName = "GSB_taunt.dds"
BuffName = "Shen Shadow Dash Taunt"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Taunted"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_taunt_multi_unit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  }
}
