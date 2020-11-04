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
          DestVar = "MaxEnergy",
          OwnerVar = "Owner",
          Function = GetMaxPAR,
          PARType = PAR_SHIELD
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "CharLevel"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CharLevel",
          Src1Value = 0,
          Src2Value = 30,
          DestVar = "ShieldMax",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ShieldMax",
          Src1Value = 0,
          Src2Value = 110,
          DestVar = "ShieldMax",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "ShieldMax",
          Index = 1
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxEnergy",
          Src1Value = 0,
          Src2Value = 0.03,
          DestVar = "ShieldDecay",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ShieldDecay",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "ShieldDecay",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_SHIELD,
          DeltaVar = "ShieldDecay"
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
