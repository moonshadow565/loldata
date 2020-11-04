BuffTextureName = "3138_Leviathan.dds"
BuffName = "LeviathanCap"
AutoBuffActivateEffect = "Aegis_buf.troy"
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "LeviathanCheck"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.9,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              BuffName = "LeviathanStats"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 10,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1000,
              Flags = "AffectFriends AffectHeroes AlwaysSelf ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "LeviathanAura",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
      Name = "leviathancheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanstats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanaura"
    }
  }
}
