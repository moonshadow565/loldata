BuffTextureName = "33.dds"
BuffName = "AkaliTwinDisciplines"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AkaliAP"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "AkaliAP",
          Value2 = 20,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AkaliAP",
              DestVarTable = "NextBuffVars",
              SrcVar = "AkaliAP"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "AkaliTwinAP",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatPhysicalDamageMod,
          TargetVar = "Owner",
          DestVar = "AkaliDmg"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "AkaliDmg",
          Value2 = 10,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AkaliDmg",
              DestVarTable = "NextBuffVars",
              SrcVar = "AkaliDmg"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "AkaliTwinDmg",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      Name = "akalitwinap"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalitwindmg"
    }
  }
}
