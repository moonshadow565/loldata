BuffTextureName = "Nasus_SoulEater.dds"
BuffName = "SoulEater"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastLifesteal",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
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
          DestVar = "CurrentLifesteal",
          SrcValueByLevel = {
            14,
            14,
            14,
            14,
            14,
            17,
            17,
            17,
            17,
            17,
            20,
            20,
            20,
            20,
            20,
            20,
            20,
            20
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentLifesteal",
          Src2Var = "LastLifesteal",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastLifesteal",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentLifesteal"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "CurrentLifesteal",
              Index = 1
            }
          }
        }
      }
    }
  }
}
