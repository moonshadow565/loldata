BuffTextureName = "Evelynn_Stalk.dds"
BuffName = "Silent Killer"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaliceDrain",
          SrcValueByLevel = {
            130,
            160,
            190,
            220,
            250,
            280,
            310,
            340,
            370,
            400,
            430,
            460,
            490,
            520,
            550,
            580,
            610,
            640,
            640
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "MaliceDrain",
          Index = 1
        }
      }
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "MaliceDrain",
              DeltaVarTable = "CharVars",
              HealerVar = "Owner"
            }
          }
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "MaliceDrain",
          DeltaVarTable = "CharVars",
          HealerVar = "Owner"
        }
      }
    }
  }
}
