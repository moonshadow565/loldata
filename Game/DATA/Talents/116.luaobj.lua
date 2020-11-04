UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExperienceMod",
      SrcValueByLevel = {
        0.0125,
        0.025,
        0.0375,
        0.05
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentEXPBonus,
      TargetVar = "Owner",
      DeltaVar = "ExperienceMod",
      Delta = 0
    }
  }
}
