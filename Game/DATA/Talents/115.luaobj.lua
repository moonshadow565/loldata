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
      DestVar = "ManaMod",
      SrcValueByLevel = {
        0.0125,
        0.025,
        0.0375,
        0.05
      }
    }
  },
  {
    Function = BBIncPercentPARPoolMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "ManaMod",
      Delta = 0
    }
  }
}
