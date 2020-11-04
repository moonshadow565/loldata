UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "PrideShield"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "PrideCooldown"
            },
            SubBlocks = {
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatMagicDamageMod,
                  TargetVar = "Owner",
                  DestVar = "AP"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AP",
                  Src1Value = 0,
                  Src2Value = 0.8,
                  DestVar = "APBonus",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "APBonus",
                  Src1Value = 0,
                  Src2Value = 250,
                  DestVar = "ShieldHealth",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ShieldHealth",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ShieldHealth"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "PrideShield",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 25,
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
      Name = "prideshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pridecooldown"
    }
  }
}
