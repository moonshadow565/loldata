PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DebuffDuration",
      DestVarTable = "InstanceVars",
      SrcValue = 5
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "TeemoMoveQuickDebuff",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "DebuffDuration",
      DurationVarTable = "InstanceVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TeemoMoveQuickDebuff"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "TeemoMoveQuickSpeed"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "MoveQuick"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "TeemoMoveQuickSpeed"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "TeemoMoveQuickSpeed",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Haste,
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
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_PERIODIC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "TeemoMoveQuickDebuff",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "DebuffDuration",
              DurationVarTable = "InstanceVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "TeemoMoveQuickDebuff",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "DebuffDuration",
              DurationVarTable = "InstanceVars",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teemomovequickdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teemomovequickspeed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "movequick"}
  }
}
