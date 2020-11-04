NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2004_Flask_of_Crystal_Water.dds"
BuffName = "Mana Potion"
AutoBuffActivateEffect = "ManaPotion_itm.troy"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "PercentMana",
      OwnerVar = "Owner",
      Function = GetManaPercent
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PercentMana",
      Value2 = 0.99,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
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
        Function = BBIncMana,
        Params = {TargetVar = "Owner", Delta = 5}
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "manaPercent",
      DestVarTable = "TempTable1",
      OwnerVar = "Owner",
      Function = GetManaPercent
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
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Heal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 20,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
