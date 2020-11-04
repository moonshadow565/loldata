BuffTextureName = "DarkChampion_Fury.dds"
BuffName = "Battle Fury"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncFlatPARPoolMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      Delta = -50000
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      Delta = -10
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthPercent",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "HealthPercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthPercentMissing",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "CritChanceMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritChanceMod",
      Src1Value = 0.1,
      Src2Value = 0,
      DestVar = "CritChanceMod",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "CritChanceMod",
      Delta = 0
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "CritChanceMod",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "CritChanceMod",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "CritChanceMod",
          Index = 1
        }
      }
    }
  }
}
