BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Strike"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_q_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterattackspeedbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_q_crit_tar.troy"
    }
  }
}
