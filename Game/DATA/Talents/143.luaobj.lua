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
      DestVar = "RallyMagicDamageMod",
      DestVarTable = "AvatarVars",
      SrcValue = 0.2
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RallyDurationBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {5, 10}
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RallyArmorBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {10, 20}
    }
  }
}
