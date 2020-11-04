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
      DestVar = "Greed",
      SrcValueByLevel = {
        0.5,
        1,
        1.5,
        2
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatGoldPer10Mod,
      TargetVar = "Owner",
      DeltaVar = "Greed",
      Delta = 0
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {}
