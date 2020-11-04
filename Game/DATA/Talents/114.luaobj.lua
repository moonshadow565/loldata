UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.005,
      Src2Value = 0,
      DestVar = "DodgeMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatDodgeMod,
      TargetVar = "Owner",
      DeltaVar = "DodgeMod",
      Delta = 0
    }
  }
}
