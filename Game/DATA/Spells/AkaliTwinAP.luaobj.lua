BuffTextureName = "AkaliTwinDisciplines.dds"
BuffName = "AkaliTwinAP"
AutoBuffActivateEffect2 = "akali_twinDisciplines_AP_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_mark_impact_tar.troy"
    }
  }
}
