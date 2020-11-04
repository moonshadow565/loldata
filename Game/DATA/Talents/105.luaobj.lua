UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.01,
      Src2Value = 0,
      DestVar = "AttackSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      Delta = 0
    }
  }
}
