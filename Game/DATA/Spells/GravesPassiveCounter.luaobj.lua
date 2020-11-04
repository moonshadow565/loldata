NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "GravesTrueGrit.dds"
BuffName = "GravesPassiveCounter"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "GravesPassiveGrit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "GravesPassiveGrit",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_AmmoStack,
          MaxStack = 11,
          NumberOfStacks = 2,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorAmount",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "ArmorAmountNeg",
      DestVarTable = "CharVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmountNeg",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmountNeg",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
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
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "GravesPassiveGrit"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 11,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "GravesPassiveGrit",
              BuffAddType = BUFF_STACKS_AND_CONTINUE,
              StacksExclusive = true,
              BuffType = BUFF_AmmoStack,
              MaxStack = 11,
              NumberOfStacks = 1,
              Duration = 4,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravespassivegrit"
    }
  }
}
