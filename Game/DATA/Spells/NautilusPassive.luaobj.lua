BuffTextureName = "3114_Malady.dds"
BuffName = "NautilusPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusrunoverride2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusrunoverride"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusgrandlinestart"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusgrandlinetarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusfacingfix"
    }
  }
}
