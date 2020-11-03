UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 0.2,
      Src2Value = 0,
      DestVar = "HPRegenBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "HPRegenBonus",
      Delta = 0
    }
  }
}
