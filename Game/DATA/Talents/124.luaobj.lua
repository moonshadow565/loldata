SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.5,
      Src2Value = 0,
      DestVar = "TeleportDelayBonus",
      DestVarTable = "AvatarVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TeleportCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {5, 10}
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PromoteCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcValueByLevel = {30, 30}
    }
  }
}
