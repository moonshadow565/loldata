PersistsThroughDeath = true
NonDispellable = true
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
              IncludeBots = true,
              DestVar = "NumAlliedChampions",
              DestVarTable = "InstanceVars"
            }
          },
          {
            Function = BBGetNumberOfHeroesOnTeam,
            Params = {
              Team = TEAM_CHAOS,
              ConnectedFromStart = false,
              IncludeBots = true,
              DestVar = "NumHostileChampions"
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
              IncludeBots = true,
              DestVar = "NumAlliedChampions",
              DestVarTable = "InstanceVars"
            }
          },
          {
            Function = BBGetNumberOfHeroesOnTeam,
            Params = {
              Team = TEAM_ORDER,
              ConnectedFromStart = false,
              IncludeBots = true,
              DestVar = "NumHostileChampions"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "NumAlliedChampions",
          Src1VarTable = "InstanceVars",
          Src2Var = "NumHostileChampions",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "PositiveChampionDelta"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "NumAlliedChampions",
          Src1VarTable = "InstanceVars",
          Src2Var = "NumHostileChampions",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "PositiveChampionDelta",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 21,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "PositiveChampionDelta"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "positivechampiondelta"
    }
  }
}
