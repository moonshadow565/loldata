SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StifleDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 0.5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StifleCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 10
    }
  }
}
