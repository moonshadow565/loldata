BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "HeimerPassive"
AutoBuffActivateEffect = "Heimerdinger_Energy.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_q_target.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_q_directaggro.troy"
    }
  }
}
