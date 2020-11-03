BuffTextureName = "Caitlyn_Headshot.dds"
BuffName = "Headshot Marker"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 8, Index = 1}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "lastTooltip",
      DestVarTable = "InstanceVars",
      SrcValue = 8
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
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            7,
            7,
            7,
            7,
            7,
            7,
            6,
            6,
            6,
            6,
            6,
            6,
            5,
            5,
            5,
            5,
            5,
            5
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "tooltipAmount",
          Src1VarTable = "CharVars",
          Src2Var = "lastTooltip",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "lastTooltip",
              DestVarTable = "CharVars",
              SrcVar = "tooltipAmount",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "tooltipAmount",
              Src1VarTable = "CharVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "BuffTooltip",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "BuffTooltip",
              Index = 1
            }
          }
        }
      }
    }
  }
}
