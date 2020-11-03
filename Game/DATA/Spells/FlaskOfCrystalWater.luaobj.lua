NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2004_Flask_of_Crystal_Water.dds"
BuffName = "Mana Potion"
AutoBuffActivateEffect = "ManaPotion_itm.troy"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "countManaPotion",
      Src1VarTable = "CharVars",
      Value2 = 2,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "countManaPotion",
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
          BuffName = "FlaskOfCrystalWater",
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
          DestVar = "countManaPotion",
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
      DestVar = "manaPercent",
      DestVarTable = "TempTable1",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "manaPercent",
      Src1VarTable = "TempTable1",
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Target",
      BuffName = "FlaskOfCrystalWater",
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
      DestVar = "countManaPotion",
      DestVarTable = "CharVars",
      TargetVar = "Owner",
      BuffName = "FlaskOfCrystalWater"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "flaskofcrystalwater"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "potion_internal"
    }
  }
}
