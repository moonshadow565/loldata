BuffTextureName = "FallenAngel_Empathize.dds"
BuffName = "KarmaPassive"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 30, Index = 1}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercentHealth",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentHealth",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "CharLevel"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CharLevel",
      Value2 = 3,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 30,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CharLevel",
      Value2 = 6,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 50,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CharLevel",
      Value2 = 9,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 70,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CharLevel",
      Value2 = 12,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 90,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CharLevel",
      Value2 = 15,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 110,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentMissing",
          Src1Value = 0,
          Src2Value = 130,
          DestVar = "APGain",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APGain",
      Delta = 0
    }
  }
}
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
        Params = {Value = 50, Index = 1}
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
        Params = {Value = 70, Index = 1}
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
        Params = {Value = 90, Index = 1}
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
        Params = {Value = 110, Index = 1}
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
        Params = {Value = 130, Index = 1}
      }
    }
  }
}
