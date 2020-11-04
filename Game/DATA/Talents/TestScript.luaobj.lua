UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.8,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "CharVars"
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 400,
          Flags = "AffectFriends AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedIncrease",
              DestVarTable = "NextBuffVars",
              SrcVar = "AttackSpeedIncrease",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "DivineBlessingAura",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Test",
      DestVarTable = "AvatarVars",
      SrcValue = 10
    }
  }
}
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedIncrease",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
        0.16,
        0.16,
        0.16,
        0.16,
        0.16,
        0.22,
        0.22,
        0.22,
        0.22,
        0.22,
        0.28,
        0.28,
        0.28,
        0.28
      }
    }
  }
}
