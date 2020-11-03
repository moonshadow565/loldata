BuffTextureName = "035_Tower_Shield.dds"
BuffName = "Turret Shield"
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "gameTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "gameTime",
      Src1Value = 0,
      Src2Value = 1.11E-4,
      DestVar = "aoeReduction",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "aoeReduction",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "aoeReduction",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "aoeReduction",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "aoeReduction",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "aoeReduction",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "aoeReduction",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "aoeReduction",
      Index = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 30,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetGameTime,
        Params = {SecondsVar = "gameTime"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "gameTime",
          Src1Value = 0,
          Src2Value = 1.11E-4,
          DestVar = "aoeReduction",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "aoeReduction",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "aoeReduction",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "aoeReduction",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "aoeReduction",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "aoeReduction",
          Src1Value = 0,
          Src2Value = 100,
          DestVar = "aoeReduction",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "aoeReduction",
          Index = 1
        }
      }
    }
  }
}
