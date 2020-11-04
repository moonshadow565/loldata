BuffTextureName = "MasterYi_DoubleStrike.dds"
BuffName = "Double Strike"
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
          DestVar = "CurrentDoubleStrike",
          SrcValueByLevel = {
            8,
            8,
            8,
            8,
            8,
            8,
            10,
            10,
            10,
            10,
            10,
            10,
            12,
            12,
            12,
            12,
            12,
            12
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentDoubleStrike",
          Src2Var = "LastDoubleStrike",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastDoubleStrike",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentDoubleStrike"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "CurrentDoubleStrike",
              Index = 1
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastDoubleStrike",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
