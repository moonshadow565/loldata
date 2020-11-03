NotSingleTargetSpell = false
BuffTextureName = "Lulu_Whimsy.dds"
BuffName = "LuluWBuff"
AutoBuffActivateEffect = "Lulu_W_buf_01.troy"
AutoBuffActivateAttachBoneName = "root"
AutoBuffActivateEffect2 = "Lulu_W_buf_02.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = "Lulu_W_buf_hand_cas.troy"
AutoBuffActivateAttachBoneName3 = "l_hand"
AutoBuffActivateEffect4 = "Lulu_W_buf_hand_cas.troy"
AutoBuffActivateAttachBoneName4 = "r_hand"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lulupassiverun"
    }
  }
}
