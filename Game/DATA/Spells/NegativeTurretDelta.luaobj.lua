OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "StartTime",
      SecondsVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "CurrentTime"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentTime",
      Src2Var = "StartTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeDelta",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TimeDelta",
      Src1Value = 0,
      Src2Value = 90,
      DestVar = "TimeDelta",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TimeDelta",
      Src1Value = 0,
      Src2Value = 90,
      DestVar = "TimePercent",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TimePercent",
      Src1Value = -0.05,
      Src2Value = 0,
      DestVar = "PercentBonus",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalReduction,
      TargetVar = "Owner",
      DeltaVar = "PercentBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
