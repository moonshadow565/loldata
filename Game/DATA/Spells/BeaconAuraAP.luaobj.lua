BuffTextureName = "Summoner_rally.dds"
BuffName = "Rally Aura AP"
AutoBuffActivateEffect = "Divineblessing_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "beaconauranoparticleap"
    }
  }
}
