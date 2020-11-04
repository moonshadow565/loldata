BuffTextureName = "Summoner_teleport.dds"
BuffName = "Teleport_Target"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleport_target_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleport_target_red.troy"
    }
  }
}
