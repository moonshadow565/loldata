BuffTextureName = "48thSlave_WaveOfLoathing.dds"
BuffName = "BlessingoftheLizardElder"
AutoBuffActivateEffect = ""
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "neutralmonster_buf_red_offense.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "burning"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
