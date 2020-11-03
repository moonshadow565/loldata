BuffTextureName = "DarkChampion_Fury.dds"
BuffName = "Battle Fury"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodlustparticle"
    }
  }
}
