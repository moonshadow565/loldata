NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "SkarnerExoskeleton.dds"
BuffName = "SkarnerExoskeleton"
AutoBuffActivateEffect = "Skarner_Exoskeleton_buf_r_arm.troy"
AutoBuffActivateAttachBoneName = "R_sub_hand"
AutoBuffActivateEffect2 = "Skarner_Exoskeleton_buf_l_arm.troy"
AutoBuffActivateAttachBoneName2 = "L_sub_hand"
AutoBuffActivateEffect3 = "Skarner_Exoskeleton_body.troy"
AutoBuffActivateAttachBoneName3 = "chest"
AutoBuffActivateEffect4 = "Skarner_Exoskeleton_tail.troy"
AutoBuffActivateAttachBoneName4 = "tail"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_exoskeleon_shatter.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerexoskeleton"
    }
  }
}
