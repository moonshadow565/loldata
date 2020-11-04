BuffTextureName = "Shen_KiStrike.dds"
BuffName = "ShenWayOfTheNinjaMarker"
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
