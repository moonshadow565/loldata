NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "MasterYi_SunderingStrikes.dds"
BuffName = "WujuStyle"
AutoBuffActivateEffect = "MasterYi_Base_E_buff.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_Cstm_Sword1_loc"
AutoBuffActivateEffect2 = "MasterYi_Base_E_Sword1_buf.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_sword2_loc"
AutoBuffActivateEffect3 = "MasterYi_Base_E_Sword1_buf.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_sword3_loc"
AutoBuffActivateEffect4 = "MasterYi_Base_E_Sword4_buf.troy"
AutoBuffActivateAttachBoneName4 = "BUFFBONE_CSTM_sword4_loc"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wujustylevisual"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wujustylesupercharged"
    }
  }
}
