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
      DestVar = "ExhaustArmorMod",
      DestVarTable = "AvatarVars",
      SrcValue = -25
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExhaustDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 0,
      SrcValueByLevel = {0.5, 1}
    }
  }
}
