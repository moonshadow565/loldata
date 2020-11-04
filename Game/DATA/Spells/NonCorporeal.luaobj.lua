BuffTextureName = "Voidwalker_DampingVoid.dds"
BuffName = "Non-Corporeal"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 30
    }
  }
}
