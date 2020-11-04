BuffTextureName = "GSB_stealth.dds"
BuffName = "Is Ninja"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 20,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "teamID"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "numOtherNinjas",
          SrcValue = -1
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "teamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachChampion,
            Params = {IteratorVar = "Unit", Team = TEAM_ORDER},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "IsNinja"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "numOtherNinjas",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "numOtherNinjas",
                      MathOp = MO_ADD
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
            Params = {IteratorVar = "Unit", Team = TEAM_CHAOS},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "IsNinja"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "numOtherNinjas",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "numOtherNinjas",
                      MathOp = MO_ADD
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "numOtherNinjas",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "damageMod",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "damageMod",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "damageMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "isninja"}
  }
}
