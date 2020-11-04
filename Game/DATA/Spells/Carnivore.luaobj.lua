BuffTextureName = "GreenTerror_TailSpike.dds"
BuffName = "Carnivore"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastHeal",
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
          DestVar = "CurrentHeal",
          SrcValueByLevel = {
            40,
            42,
            45,
            47,
            50,
            52,
            55,
            57,
            60,
            62,
            65,
            67,
            70,
            72,
            75,
            77,
            80,
            82
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentHeal",
          Src2Var = "LastHeal",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastHeal",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentHeal"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "CurrentHeal",
              Index = 1
            }
          }
        }
      }
    }
  }
}
