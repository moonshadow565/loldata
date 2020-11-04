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
      DeltaByLevel = {
        0.033,
        0.066,
        0.1
      }
    }
  }
}
