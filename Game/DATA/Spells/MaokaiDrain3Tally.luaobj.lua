OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DrainAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DrainAmount",
      Src1VarTable = "InstanceVars",
      Src2Var = "Tally",
      Src2VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Tally",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
