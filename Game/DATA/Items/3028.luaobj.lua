UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "PercentMana",
      OwnerVar = "Owner",
      Function = GetManaPercent
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentMana",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "PercentMissing",
      Delta = 0
    }
  }
}
