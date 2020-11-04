OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritDamageMod,
      TargetVar = "Owner",
      DeltaVar = "CritDmgBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasHit",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "CritDmgBonus",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "NewCritDmgBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritDamageMod,
      TargetVar = "Owner",
      DeltaVar = "NewCritDmgBonus",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasHit",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasHit",
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
