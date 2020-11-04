UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "TalentLevel",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "DamageInc",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageInc",
      Delta = 0
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars"
    },
    SubBlocks = {
      {
        Function = BBDebugSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "DamageInc: ",
          SrcVar = "DamageInc"
        }
      }
    }
  }
}
