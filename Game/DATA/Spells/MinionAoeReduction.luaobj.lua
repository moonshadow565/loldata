OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "gameTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "gameTime",
      Src1Value = 0,
      Src2Value = 1.11E-4,
      DestVar = "aoeReduction",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "aoeReduction",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "aoeReduction",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "aoeReduction",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "aoeReduction",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "aoeReduction",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "DamageMultiplier",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "DamageMultiplier",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          }
        }
      }
    }
  }
}
