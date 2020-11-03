BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Marker"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenwayoftheninjaaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenpassivehardcooldown"
    }
  }
}
