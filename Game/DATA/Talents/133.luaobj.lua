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
      DestVar = "HealBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 75
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {10, 20}
    }
  }
}
