AutoBuffActivateEffect = "Abyssalscepter_itm.troy"
AutoItemActivateEffect = ""
AutoAuraBuffName = ""
UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MagicResistanceMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -20
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "AbyssalScepterAuraSelf",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1000,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              BuffNameFilter = "AbyssalScepterAura",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AbyssalScepterAura",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Shred,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "abyssalscepterauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "abyssalscepteraura"
    }
  }
}
