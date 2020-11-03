UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MasterySeigeCommander",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterysiegecommanderbuff"
    }
  }
}
