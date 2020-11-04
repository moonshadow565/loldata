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
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastMana",
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaAmount",
          SrcValueByLevel = {
            8,
            8.5,
            9,
            9.5,
            10,
            10.5,
            11,
            11.5,
            12,
            12.5,
            13,
            13.5,
            14,
            14.5,
            15,
            15.5,
            16,
            16.5
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
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "ManaAmount",
              Index = 2
            }
          }
        }
      }
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaAmount",
      SrcValueByLevel = {
        8,
        8.5,
        9,
        9.5,
        10,
        10.5,
        11,
        11.5,
        12,
        12.5,
        13,
        13.5,
        14,
        14.5,
        15,
        15.5,
        16,
        16.5
      }
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "ManaAmount"
    }
  }
}
