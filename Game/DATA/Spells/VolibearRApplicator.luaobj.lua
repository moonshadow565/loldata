BuffTextureName = "VolibearR.dds"
BuffName = "VolibearRApplicator"
AutoBuffActivateEffect = "volibear_R_attack_buf_left.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "volibear_R_attack_buf_right.troy"
AutoBuffActivateAttachBoneName2 = "R_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect3 = "Volibear_R_cas.troy"
AutoBuffActivateEffect4 = "Volibear_R_cas_02.troy"
AutoBuffActivateAttachBoneName4 = "C_BUFFBONE_GLB_CENTER_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_cas_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_cas_04.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_lightning_arms.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_chain_lighting_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrchain"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrlimit"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_tar_02.troy"
    }
  }
}
