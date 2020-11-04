BuffTextureName = "DrMundo_AdrenalineRush.dds"
BuffName = "Nevershade"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
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
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "maxHealth",
              OwnerVar = "Owner",
              Function = GetMaxHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Regen", SrcValue = 0.003}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Regen",
              Src2Var = "maxHealth",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "HealthInc",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "HealthInc",
              HealerVar = "Owner"
            }
          }
        }
      }
    }
  }
}
