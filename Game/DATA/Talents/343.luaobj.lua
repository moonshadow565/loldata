UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = -0.0015,
      DestVar = "CDRPerLevel",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "ChampLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ChampLevel",
      Src2Var = "CDRPerLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CDRMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      DeltaVar = "CDRMod",
      Delta = 0
    }
  }
}
