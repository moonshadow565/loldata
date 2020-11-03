UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MasteryScholar",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryscholarbuff"
    }
  }
}
