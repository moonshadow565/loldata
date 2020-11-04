BuffTextureName = "Summoner_rally.dds"
BuffName = "Rally Aura"
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
      Name = "beaconauranoparticle"
    }
  }
}
