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
      DestVar = "RallyAPMod",
      DestVarTable = "AvatarVars",
      SrcValue = 70
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RallyDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {5, 10}
    }
  }
}
