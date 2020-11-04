NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Eggnog_HealthPotion.dds"
BuffName = "Health Potion"
AutoBuffActivateEffect = "Regenerationpotion_itm.troy"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurHealth",
      Src2Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PercentHealth",
      MathOp = MO_DIVIDE
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
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 10,
          HealerVar = "Owner"
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Target",
      Function = GetHealth
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurHealth",
      Src2Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PercentHealth",
      MathOp = MO_DIVIDE
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
