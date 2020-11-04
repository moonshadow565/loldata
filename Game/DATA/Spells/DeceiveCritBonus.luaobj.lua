OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasHit",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CritDmgBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritDamageMod,
      TargetVar = "Owner",
      DeltaVar = "CritDmgBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
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
