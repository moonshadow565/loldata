NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_Perseverance.dds"
BuffName = "GarenRecouperateOn"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
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
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurHealth",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "GarenRecoupDebuff"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurHealth",
              Src2Var = "MaxHealth",
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "GarenRecouperate1",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = false,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
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
      Name = "garenrecoupdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrecouperate1"
    }
  }
}
