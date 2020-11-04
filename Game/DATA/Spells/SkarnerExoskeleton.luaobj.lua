NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "SkarnerExoskeleton.dds"
BuffName = "SkarnerExoskeleton"
AutoBuffActivateEffect3 = "Skarner_Exoskeleton_body.troy"
AutoBuffActivateAttachBoneName3 = "chest"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_exoskeleton_buf_r_arm.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_exoskeleton_buf_l_arm.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_exoskeleton_tail.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_exoskeleon_shatter.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_w_buff_lines.troy"
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
