SetVarsByLevelBuildingBlocks = {
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
      DestVar = "RevivePreservationBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 400
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ReviveCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {30, 40}
    }
  }
}
