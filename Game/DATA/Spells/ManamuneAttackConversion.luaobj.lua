BuffTextureName = "3005_Atmas_Impaler.dds"
BuffName = "Atma's Impaler"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "OwnerMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerMana",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.02,
      DestVar = "LessOwnerMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "LessOwnerMana",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "OwnerMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  }
}
