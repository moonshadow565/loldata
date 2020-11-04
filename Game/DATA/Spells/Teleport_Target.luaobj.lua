BuffTextureName = "Summoner_teleport.dds"
BuffName = "Teleport_Target"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_teleport_target_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_teleport_target_red.troy"
    }
  }
}
