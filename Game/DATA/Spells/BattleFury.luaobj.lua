BuffTextureName = "DarkChampion_Fury.dds"
BuffName = "Battle Fury"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncFlatPARPoolMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      Delta = -50000
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      Delta = -10
    }
  }
}
