BuffTextureName = "Bowmaster_Bullseye.dds"
BuffName = "Focus"
PersistsThroughDeath = true
NonDispellable = true
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
          DestVar = "CurrentCrit",
          SrcValueByLevel = {
            0.03,
            0.03,
            0.03,
            0.06,
            0.06,
            0.06,
            0.09,
            0.09,
            0.09,
            0.12,
            0.12,
            0.12,
            0.15,
            0.15,
            0.15,
            0.18,
            0.18,
            0.18
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentCrit",
          Src2Var = "LastCrit",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CurrentCrit",
              Src1Value = 100,
              Src2Value = 0,
              DestVar = "TooltipCritChance",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastCrit",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentCrit"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "TooltipCritChance",
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
      DestVar = "LastCrit",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
