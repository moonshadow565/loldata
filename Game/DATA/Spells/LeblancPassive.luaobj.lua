BuffTextureName = "LeblancMirrorImage.dds"
BuffName = "LeblancNoxianCruelty"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "akali_twinDisciplines_AP_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateAttachBoneName4 = ""
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancpassivecooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancmiapplicator"
    }
  }
}
