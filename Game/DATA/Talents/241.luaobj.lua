UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritDamageMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {0.1}
    }
  }
}
