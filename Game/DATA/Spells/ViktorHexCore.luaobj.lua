DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaToADD",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthToADD",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "BonusForItem",
      DestVarTable = "CharVars",
      MathOp = MO_MULTIPLY
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "ManaCost", Info = GetPARCost}
  },
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
      DestVar = "CurrHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "MaxHealthReturn",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxPAR",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrPAR",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxPAR",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "MaxPARReturn",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaCost",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "CurrentADDMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaCost",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "CurrentADDHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaToADD",
      Src1VarTable = "CharVars",
      Src2Var = "CurrentADDMana",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ManaToADD",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthToADD",
      Src1VarTable = "CharVars",
      Src2Var = "CurrentADDHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToADD",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "BonusForItem",
      DestVarTable = "CharVars",
      MathOp = MO_MULTIPLY
    }
  }
}
