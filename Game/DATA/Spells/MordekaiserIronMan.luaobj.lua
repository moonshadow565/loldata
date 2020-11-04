BuffTextureName = "DrMundo.KissOfDeath.dds"
BuffName = "MordekaiserIronMan"
PersistsThroughDeath = true
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
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentEnergy",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_SHIELD
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
          Value2 = 6,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 150, Index = 1}
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 5, Index = 2}
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = -5,
              PARType = PAR_SHIELD
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
            Function = BBSetBuffToolTipVar,
            Params = {Value = 300, Index = 1}
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 10, Index = 2}
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = -10,
              PARType = PAR_SHIELD
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {CompareOp = CO_EQUAL},
        SubBlocks = {
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 450, Index = 1}
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {Value = 15, Index = 2}
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = -15,
              PARType = PAR_SHIELD
            }
          }
        }
      }
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = MAGIC_DAMAGE,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "DamageAmount",
          Src1Value = 0.2,
          Src2Value = 0,
          DestVar = "ShieldDelta",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_SHIELD,
          DeltaVar = "ShieldDelta"
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentEnergy",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_SHIELD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "DA",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_SHIELD,
      DeltaVar = "DA"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentEnergy",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
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
          Src1Var = "DamageAmount",
          Src2Var = "CurrentEnergy",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
