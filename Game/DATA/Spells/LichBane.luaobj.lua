BuffTextureName = "126_Zeal_and_Sheen.dds"
BuffName = "LichBane"
AutoBuffActivateEffect = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheen"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheendelay"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "lichbane"}
  }
}
