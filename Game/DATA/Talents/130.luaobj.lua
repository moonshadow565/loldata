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
      DestVar = "GhostMovementBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {0.08}
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {1.5, 3}
    }
  }
}
