NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "GravesTrueGrit.dds"
BuffName = "GravesPassive"
AutoBuffActivateEffect = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "GravesPassiveGrit"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorAmount",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 1, Index = 1}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 1, Index = 1}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 9,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 2, Index = 1}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 12,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 2, Index = 1}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 15,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 2, Index = 1}
      }
    }
  }
}
