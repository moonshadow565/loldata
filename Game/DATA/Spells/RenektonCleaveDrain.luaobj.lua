OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DrainPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaxDrain",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainCount",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainAmount",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = PHYSICAL_DAMAGE,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "DrainPercent",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DrainHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DrainHealth",
              Src1Value = 0,
              Src2Value = 4,
              DestVar = "DrainHealth",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxDrain",
          Src1VarTable = "InstanceVars",
          Src2Var = "DrainAmount",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DrainCandidate",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DrainHealth",
          Src2Var = "DrainCandidate",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DrainHealth",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DrainHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DrainHealth",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Attacker",
          Delta = 0,
          DeltaVar = "DrainHealth",
          HealerVar = "Attacker"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DrainCount",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "DrainCount",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DrainAmount",
          Src1VarTable = "InstanceVars",
          Src2Var = "DrainHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DrainAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
