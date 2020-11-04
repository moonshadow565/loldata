BuffTextureName = "3051_Renewal_Tunic.dds"
BuffName = "Renewal Shell"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      Delta = 4
    }
  }
}
