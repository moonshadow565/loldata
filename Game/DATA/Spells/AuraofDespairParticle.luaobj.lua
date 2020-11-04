BuffTextureName = "SadMummy_AuraofDespair.dds"
BuffName = "AuraofDespair"
AutoBuffActivateEffect = "Despair_buf.troy"
AutoBuffActivateAttachBoneName = "head"
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LifeLossPercent",
          DestVarTable = "NextBuffVars",
          SrcVar = "LifeLossPercent",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeLossPercent",
          Src1VarTable = "CharVars",
          Src2Var = "LastLifeLossPercent",
          Src2VarTable = "CharVars",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 350,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AuraofDespairDrainLife",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 350,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AuraofDespairDrainLife",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastLifeLossPercent",
          DestVarTable = "CharVars",
          SrcVar = "LifeLossPercent",
          SrcVarTable = "CharVars"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "auraofdespairdrainlife"
    }
  }
}
