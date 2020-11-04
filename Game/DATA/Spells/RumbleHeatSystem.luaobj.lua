BuffTextureName = "Rumble_Junkyard Titan1.dds"
BuffName = "RumbleHeatSystem"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatingup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatingup2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbledangerzone"
    }
  }
}
