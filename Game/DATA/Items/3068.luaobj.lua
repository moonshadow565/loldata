AutoItemActivateEffect = ""
UpdateSelfBuffActionsBuildingBlocks = {
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
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
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
              Range = 400,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 40
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "SunfireCapeAura",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Damage,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 1.05,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "SunfireCloakParticle",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
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
      Name = "sunfirecapeaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sunfirecloakparticle"
    }
  }
}
