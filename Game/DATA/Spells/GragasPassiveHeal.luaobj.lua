BuffTextureName = "GragasPassiveHeal.dds"
BuffName = "GragasPassiveHeal"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxHP",
      OwnerVar = "Target",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHP",
      Src1Value = 0,
      Src2Value = 0.01,
      DestVar = "HealAmount",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1.9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealAmount",
          DeltaVarTable = "InstanceVars",
          HealerVar = "Owner"
        }
      }
    }
  }
}
