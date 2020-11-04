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
      Stat = IncFlatArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        2,
        4,
        6
      }
    }
  }
}
