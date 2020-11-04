BuffTextureName = "LeblancMirrorImage.dds"
BuffName = "LeblancNoxianCruelty"
AutoBuffActivateEffect2 = "akali_twinDisciplines_AP_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancmiapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancpassivecooldown"
    }
  }
}
