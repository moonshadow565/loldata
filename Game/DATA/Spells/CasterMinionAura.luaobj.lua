BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "Caster Minion Aura"
AutoBuffActivateEffect = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 1
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicDamageMod,
      TargetVar = "Owner",
      Delta = -1
    }
  }
}
