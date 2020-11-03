BuffTextureName = "Pantheon_AOZ.dds"
BuffName = "Pantheon Aegis"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegisshield2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegisshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegis_counter"
    }
  }
}
