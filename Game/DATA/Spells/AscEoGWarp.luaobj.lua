DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_teleport.dds"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_asc_teleport_target.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascwarpreappear"
    }
  }
}
