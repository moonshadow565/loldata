BuffTextureName = "Maokai_SapMagicReady.dds"
BuffName = "MaokaiSapMagicMelee"
AutoBuffActivateEffect = "maokai_passive_indicator_left_eye.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_SHIELDEYE_L"
AutoBuffActivateEffect2 = "maokai_passive_indicator_right_eye.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_SHIELDEYE_R"
AutoBuffActivateEffect3 = "maokai_passive_indicator_graveDigger.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_L_HAND"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_heal.troy"
    }
  }
}
