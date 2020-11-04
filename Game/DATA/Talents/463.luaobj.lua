SetVarsByLevelBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.15,
      Src2Value = 0,
      DestVar = "SummonerCooldownBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SummonerCooldownBonus",
      DestVarTable = "AvatarVars",
      SrcVar = "SummonerCooldownBonus"
    }
  }
}
