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
      DestVar = "RegenPercent",
      SrcValueByLevel = {
        0.02,
        0.03,
        0.04
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "RegenPercent",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "RegenPercent",
      Delta = 0
    }
  }
}
