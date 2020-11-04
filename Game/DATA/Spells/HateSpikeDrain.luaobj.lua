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
      RequiredVar = "DrainCount",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainCount",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainCount",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_LESS_THAN
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
      }
    }
  }
}
