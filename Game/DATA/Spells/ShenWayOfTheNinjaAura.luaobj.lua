BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Aura"
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
