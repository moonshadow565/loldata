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
      DestVar = "MasteryBounty",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MasteryBountyAmt",
      DestVarTable = "AvatarVars",
      SrcValue = 0,
      SrcValueByLevel = {
        8,
        16,
        24
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterybountyhunterbuff"
    }
  }
}
