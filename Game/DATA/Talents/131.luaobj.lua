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
      DestVar = "BoostCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 30
    }
  }
}
