PersistsThroughDeath = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBFadeOutColorFadeEffect,
    Params = {FadeTime = 1, SpecificToTeam = TEAM_UNKNOWN}
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = 100,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachChampion,
        Params = {
          IteratorVar = "Unit",
          Team = TEAM_CHAOS,
          BuffNameFilter = "NocturneParanoiaParticle",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "Duration",
              TargetVar = "Unit",
              BuffName = "NocturneParanoiaParticle"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Duration",
              Value2 = 0.5,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBFadeInColorFadeEffect,
                Params = {
                  ColorRed = 75,
                  ColorGreen = 0,
                  ColorBlue = 0,
                  FadeTime = 1,
                  MaxWeight = 0.3,
                  SpecificToTeam = TEAM_ORDER
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBForEachChampion,
        Params = {
          IteratorVar = "Unit",
          Team = TEAM_ORDER,
          BuffNameFilter = "NocturneParanoiaParticle",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "Duration",
              TargetVar = "Unit",
              BuffName = "NocturneParanoiaParticle"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Duration",
              Value2 = 0.5,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBFadeInColorFadeEffect,
                Params = {
                  ColorRed = 75,
                  ColorGreen = 0,
                  ColorBlue = 0,
                  FadeTime = 1,
                  MaxWeight = 0.3,
                  SpecificToTeam = TEAM_CHAOS
                }
              }
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
      Name = "nocturneparanoiaparticle"
    }
  }
}
