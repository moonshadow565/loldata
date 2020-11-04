BuffTextureName = "3025_Frozen_Fist.dds"
BuffName = "LichBane"
AutoBuffActivateEffect = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_shadowswipe_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_infuse_ally_tar.troy"
    }
  }
}
