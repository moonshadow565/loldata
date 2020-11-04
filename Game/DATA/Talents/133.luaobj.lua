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
      DestVar = "HealCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {30, 30}
    }
  }
}
