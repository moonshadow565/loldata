BuffTextureName = "Minotaur_ColossalStrength.dds"
BuffName = "APBonusDamageToTowers"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "disconnecttimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "s4spawnlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "positivechampiondelta"
    }
  }
}
