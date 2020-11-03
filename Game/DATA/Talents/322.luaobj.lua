UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = 1.5,
      DestVar = "HealthPerLevel",
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
      Src2Var = "HealthPerLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncMaxHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthMod",
      IncCurrentHealth = false
    }
  }
}
