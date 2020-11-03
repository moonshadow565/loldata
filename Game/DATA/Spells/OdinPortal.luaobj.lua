BuffTextureName = ""
BuffName = "OdinShrineAura"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0,
      TickTimeVar = "0.5",
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 250,
          Flags = "AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Unit",
              BuffName = "OdinPortalMoveCheck"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count2",
                  TargetVar = "Unit",
                  BuffName = "OdinPortalChannel"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count2",
                  Value2 = 0,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBGetBuffCountFromAll,
                    Params = {
                      DestVar = "Count3",
                      TargetVar = "Unit",
                      BuffName = "OdinPortalTeleport"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Count3",
                      Value2 = 0,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Unit",
                          BuffName = "OdinPortalMoveCheck",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 0.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      }
                    }
                  }
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
      Name = "odinportalmovecheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalchannel"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalteleport"
    }
  }
}
