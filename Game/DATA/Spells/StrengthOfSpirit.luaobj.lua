PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "hpRegen",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "multiplier",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "hpRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "maxMana",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "multiplier",
      Src1VarTable = "InstanceVars",
      Src2Var = "maxMana",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "hpRegen",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
