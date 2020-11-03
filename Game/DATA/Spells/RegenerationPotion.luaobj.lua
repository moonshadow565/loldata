NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2003_Regeneration_Potion.dds"
BuffName = "Health Potion"
AutoBuffActivateEffect = "Regenerationpotion_itm.troy"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "countHealthPotion",
      Src1VarTable = "CharVars",
      Value2 = 2,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "countHealthPotion",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "stacksToAdd",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RegenerationPotion",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Heal,
          MaxStack = 5,
          NumberOfStacks = 0,
          NumberOfStacksVar = "stacksToAdd",
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Target",
          BuffName = "Potion_Internal",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "countHealthPotion",
          DestVarTable = "CharVars",
          SrcValue = 0
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercentHealth",
      OwnerVar = "Target",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PercentHealth",
      Value2 = 0.99,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Target",
      BuffName = "RegenerationPotion",
      BuffAddType = BUFF_STACKS_AND_CONTINUE,
      StacksExclusive = false,
      BuffType = BUFF_Heal,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 15,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Target",
      BuffName = "Potion_Internal",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 15,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "countHealthPotion",
      DestVarTable = "CharVars",
      TargetVar = "Owner",
      BuffName = "RegenerationPotion"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "regenerationpotion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "potion_internal"
    }
  }
}
