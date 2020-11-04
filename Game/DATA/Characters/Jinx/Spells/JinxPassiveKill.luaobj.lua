BuffTextureName = "Jinx_Passive.dds"
BuffName = "JinxPassiveKill"
AutoBuffActivateEffect = "Jinx_Passive_Buff.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jinx_passive_buff_onkill.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
