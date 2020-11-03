UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxMana",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxMana",
      Src1Value = 0.001,
      Src2Value = 0,
      DestVar = "RegenMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxMana",
      Src1Value = 0.002,
      Src2Value = 0,
      DestVar = "RegenMod2",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxMana",
      Src1Value = 0.003,
      Src2Value = 0,
      DestVar = "RegenMod3",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPRegenMod,
          TargetVar = "Owner",
          DeltaVar = "RegenMod",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPRegenMod,
          TargetVar = "Owner",
          DeltaVar = "RegenMod2",
          Delta = 0
        }
      }
    }
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
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPRegenMod,
          TargetVar = "Owner",
          DeltaVar = "RegenMod3",
          Delta = 0
        }
      }
    }
  }
}
