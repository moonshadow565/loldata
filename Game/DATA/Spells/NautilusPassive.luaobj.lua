BuffTextureName = "3114_Malady.dds"
BuffName = "NautilusPassive"
AutoBuffActivateEffect4 = ""
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
      Name = "nautilusfacingfix"
    }
  }
}
