BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Aura"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_kistrike_ready_indicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenwayoftheninjacooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenpassivehardcooldown"
    }
  }
}
