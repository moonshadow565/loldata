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
      DestVar = "ClairvoyanceDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ClairvoyanceCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {5, 10}
    }
  }
}
