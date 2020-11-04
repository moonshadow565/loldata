BuffTextureName = "3065_Spirit_Visage.dds"
BuffName = "Spirit Visage"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "healthPercent",
          OwnerVar = "Owner",
          Function = GetHealthPercent
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "healthPercent",
          Value2 = 0.4,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetManaOrHealth,
            Params = {
              DestVar = "maxHealth",
              OwnerVar = "Owner",
              Function = GetMaxHealth
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "maxHealth",
              Src1Value = 0,
              Src2Value = 0.01,
              DestVar = "HealthToInc",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "HealthToInc",
              HealerVar = "Owner"
            }
          }
        }
      }
    }
  }
}
