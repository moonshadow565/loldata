UpdateSelfBuffActionsBuildingBlocks = {
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
      DestVar = "MasteryInitiate",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MasteryInitiateAmt",
      DestVarTable = "AvatarVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.01,
        0.02,
        0.03
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryinitiatebuff"
    }
  }
}
