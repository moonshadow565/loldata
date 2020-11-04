PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_ORDER,
          ConnectedFromStart = true,
          IncludeBots = false,
          DestVar = "NumChampions",
          DestVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_CHAOS,
          ConnectedFromStart = true,
          IncludeBots = false,
          DestVar = "NumChampions",
          DestVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GoldDelta",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetNumberOfHeroesOnTeam,
            Params = {
              Team = TEAM_ORDER,
              ConnectedFromStart = false,
              IncludeBots = false,
              DestVar = "NumChampions"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetNumberOfHeroesOnTeam,
            Params = {
              Team = TEAM_CHAOS,
              ConnectedFromStart = false,
              IncludeBots = false,
              DestVar = "NumChampions"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "NumChampions",
          Src2Var = "NumChampions",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "NumChampions",
              Src1VarTable = "InstanceVars",
              Src2Var = "NumChampions",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ChampionDelta",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ChampionDelta",
              Src1Value = 0,
              Src2Value = 0.05,
              DestVar = "BonusExp",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ChampionDelta",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TempGoldDelta",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TempGoldDelta",
              Src2Var = "GoldDelta",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "GoldDelta",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIncPermanentStat,
            Params = {
              Stat = IncPermanentPercentEXPBonus,
              TargetVar = "Owner",
              DeltaVar = "BonusExp",
              Delta = 0
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NumChampions",
              DestVarTable = "InstanceVars",
              SrcVar = "NumChampions"
            }
          }
        }
      },
      {
        Function = BBIncGold,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "GoldDelta",
          DeltaVarTable = "InstanceVars"
        }
      }
    }
  }
}
