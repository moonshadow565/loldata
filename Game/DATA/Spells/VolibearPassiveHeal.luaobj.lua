BuffTextureName = "VolibearPassive.dds"
BuffName = "VolibearPassiveHeal"
AutoBuffActivateEffect = "volibear_passive_heal.troy"
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "maxHealth",
      OwnerVar = "Target",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "RegenPercent",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0.08333,
      DestVar = "Factor",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Factor",
      Src2Var = "maxHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Heal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
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
          DeltaVar = "Heal",
          HealerVar = "Owner"
        }
      }
    }
  }
}
