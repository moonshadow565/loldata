UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CooldownResevoir",
          Src1VarTable = "InstanceVars",
          Value2 = 2,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      }
    }
  }
}
ItemOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CooldownResevoir",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetBaseAttackDamage,
              TargetVar = "Owner",
              DestVar = "BaseDamage"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "BaseDamage"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsSheen",
              DestVarTable = "NextBuffVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Sheen",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 10,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = -1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownResevoir",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheen"}
  }
}
