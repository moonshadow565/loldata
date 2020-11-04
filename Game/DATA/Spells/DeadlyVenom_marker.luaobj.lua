BuffTextureName = "Twitch_DeadlyVenom_temp.dds"
BuffName = "Deadly Venom Marker"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "lastTooltip",
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
          DestVar = "tooltipAmount",
          SrcValueByLevel = {
            2,
            2,
            2,
            2,
            2,
            4,
            4,
            4,
            4,
            4,
            6,
            6,
            6,
            6,
            6,
            8,
            8,
            8
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "tooltipAmount",
          Src2Var = "lastTooltip",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "lastTooltip",
              DestVarTable = "InstanceVars",
              SrcVar = "tooltipAmount"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "tooltipAmount",
              Index = 1
            }
          }
        }
      }
    }
  }
}
