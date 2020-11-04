NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "MasterYi_WujuStyleActive.dds"
BuffName = "WujuStyleSuperCharged"
AutoBuffActivateEffect = "MasterYi_Base_E_SuperChraged_buf.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_Cstm_Sword1_loc"
AutoBuffActivateEffect2 = "MasterYi_Base_E_SuperChraged_Sword1_buf.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_sword2_loc"
AutoBuffActivateEffect3 = "MasterYi_Base_E_SuperChraged_Sword1_buf.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_sword3_loc"
AutoBuffActivateEffect4 = "MasterYi_Base_E_SuperChraged_Sword4_buf.troy"
AutoBuffActivateAttachBoneName4 = "BUFFBONE_CSTM_sword4_loc"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryiwujudeactivated"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wujustylesuperchargedvisual"
    }
  }
}
