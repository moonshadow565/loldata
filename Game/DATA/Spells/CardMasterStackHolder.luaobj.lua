BuffTextureName = "Cardmaster_RapidToss_Charging.dds"
BuffName = "CardMasterStack"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackholder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackparticle"
    }
  }
}
