BuffTextureName = "Tryndamere_Passive.dds"
BuffName = "Battle Fury"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "tryndamereincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodlustparticle"
    }
  }
}
