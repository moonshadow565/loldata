DoesntTriggerSpellCasts = true
BuffTextureName = "3460_Asc_Trinket.dds"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ascwarp"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascwarptarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_asc_teleport.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascwarpreappear"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascwarpprotection"
    }
  }
}
