NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "MasterYi_SunderingStrikes.dds"
BuffName = "Wuju Style"
AutoBuffActivateEffect = "WujustyleSC_buf.troy"
AutoBuffActivateAttachBoneName = "weaponstreak"
AutoBuffActivateEffect2 = "MasterYi_Tribal_Wuju_Sword_Blue.troy"
AutoBuffActivateAttachBoneName2 = "buffbone_cstm_weapon_1"
AutoBuffActivateEffect3 = "MasterYi_Tribal_Wuju_Sword_2nd_Blue.troy"
AutoBuffActivateAttachBoneName3 = "buffbone_cstm_weapon_2"
AutoBuffActivateEffect4 = "MasterYi_Tribal_Wuju_Sword_3rd_Blue.troy"
AutoBuffActivateAttachBoneName4 = "buffbone_cstm_weapon_3"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryiwujudeactivated"
    }
  }
}
