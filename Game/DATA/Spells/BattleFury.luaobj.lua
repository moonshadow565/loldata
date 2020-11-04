BuffTextureName = "DarkChampion_Fury.dds"
BuffName = "Battle Fury"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMPPoolMod,
      TargetVar = "Owner",
      Delta = -50000
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMPRegenMod,
      TargetVar = "Owner",
      Delta = -10
    }
  }
}
