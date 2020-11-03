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
      RequiredVar = "DrainedBool",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainedBool",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainedBool",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainedBool",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
