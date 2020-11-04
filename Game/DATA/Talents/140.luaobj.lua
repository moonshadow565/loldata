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
      DestVar = "FlashCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {15, 30}
    }
  }
}
