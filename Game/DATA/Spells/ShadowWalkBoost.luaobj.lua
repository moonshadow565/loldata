OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "InitialTime",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTime,
    Params = {DestVar = "CurTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurTime",
      Src2Var = "InitialTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeElapsed",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TimeElapsed",
      Src1Value = 3,
      Src2Value = 0,
      DestVar = "TimeDecay",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TimeDecay",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "RatioTime",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "RatioTime",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "MoveRatio",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveRatio",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {DestVar = "CurTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurTime",
      Src2Var = "InitialTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeElapsed",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TimeElapsed",
      Src1Value = 3,
      Src2Value = 0,
      DestVar = "TimeDecay",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TimeDecay",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "RatioTime",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "RatioTime",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "MoveRatio",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveRatio",
      Delta = 0
    }
  }
}
