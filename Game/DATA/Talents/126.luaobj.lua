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
      DestVar = "SmiteGoldBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SmiteCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 0,
      SrcValueByLevel = {5, 10}
    }
  }
}
