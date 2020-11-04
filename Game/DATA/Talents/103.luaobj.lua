UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.0066,
      Src2Value = 0,
      DestVar = "CriticalMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "CriticalMod",
      Delta = 0
    }
  }
}
