BuffTextureName = "GreenTerror_ChitinousExoplates.dds"
BuffName = "Hardening"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentHardnessMod,
      TargetVar = "Owner",
      DestVar = "HardnessPercent"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HardnessPercent",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentReduction",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Snare,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Net,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Sleep,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Taunt,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Duration",
          Src1Value = 0.3,
          Src2Value = 0,
          DestVar = "Duration",
          MathOp = MO_MAX
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentHardnessMod,
      TargetVar = "Owner",
      DestVar = "PercentReduction"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentReduction",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "PercentReduction",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PercentReduction",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "PercentReduction",
          Index = 1
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 0, Index = 1}
      }
    }
  }
}
