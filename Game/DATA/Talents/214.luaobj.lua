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
      DestVar = "MasteryButcher",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MasteryButcherAmt",
      DestVarTable = "AvatarVars",
      SrcValue = 0,
      SrcValueByLevel = {2, 4}
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterybutcherbuff"
    }
  }
}
