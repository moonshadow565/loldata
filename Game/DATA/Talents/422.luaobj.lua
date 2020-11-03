UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.005,
      Src2Value = 0,
      DestVar = "MoveSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      Delta = 0
    }
  }
}
