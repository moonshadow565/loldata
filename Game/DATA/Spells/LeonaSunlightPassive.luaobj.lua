BuffTextureName = "LeonaSunlight.dds"
BuffName = "LeonaSunlightPassive"
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
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastSunlightDamage",
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
          DestVar = "SunlightDamage",
          SrcValueByLevel = {
            20,
            20,
            35,
            35,
            50,
            50,
            65,
            65,
            80,
            80,
            95,
            95,
            110,
            110,
            125,
            125,
            140,
            140
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SunlightDamage",
          Src2Var = "LastSunlightDamage",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastSunlightDamage",
              DestVarTable = "InstanceVars",
              SrcVar = "SunlightDamage"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "SunlightDamage",
              Index = 2
            }
          }
        }
      }
    }
  }
}
