BuffTextureName = "Bowmaster_Bullseye.dds"
BuffName = "BowMasterFocusDisplay"
PersistsThroughDeath = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "NumSecondsSinceLastCrit",
      Src1VarTable = "CharVars",
      Src2Var = "CritPerSecond",
      Src2VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CritToAdd",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritToAdd",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "CritToDisplay",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritToDisplay",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "CritToTooltip",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "CritToTooltip",
      Index = 1
    }
  }
}
