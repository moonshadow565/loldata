BuffTextureName = "ViktorGravitonField.dds"
BuffName = "ViktorGravitonSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateEffect2 = "Viktor_Catalyst_buf.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldnostun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldstun"
    }
  }
}
